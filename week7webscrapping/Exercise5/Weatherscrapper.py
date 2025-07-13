import time
import re
from collections import Counter
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from bs4 import BeautifulSoup

def analyze_weather_data():
    """
    Scrapes and analyzes weather data from AccuWeather, handling
    potential inconsistencies in the source HTML.
    """
    # --- 1. Set up Selenium WebDriver ---
    # IMPORTANT: Replace with the actual path to your chromedriver.
    DRIVER_PATH = "C:/Users/vickg/OneDrive/Documents/chromedriver-win64/chromedriver-win64/chromedriver.exe"
    service = Service(executable_path=DRIVER_PATH)
    driver = webdriver.Chrome(service=service)

    url = "https://www.accuweather.com/en/us/attica/30607/weather-forecast/2139413"
    
    # This will be our main list to hold structured data for each day.
    forecast_data = []

    try:
        # --- 2. Navigate to the Page and Extract HTML ---
        print(f"Navigating to {url}...")
        driver.get(url)
        print("Waiting for dynamic content to load...")
        time.sleep(5)
        html_content = driver.page_source
        print("Page source extracted.")
    finally:
        print("Closing the browser.")
        driver.quit()

    # --- 3. Parse and Extract Data Robustly ---
    print("Parsing HTML and extracting weather data...")
    soup = BeautifulSoup(html_content, 'html.parser')

    daily_forecasts = soup.find_all('a', class_='daily-list-item')

    if not daily_forecasts:
        print("Could not find daily forecast items. The website structure may have changed.")
        return

    print(f"\n--- Scraping {len(daily_forecasts)}-Day Forecast Data ---\n")

    for day in daily_forecasts:
        # Find all elements for a single day first
        temp_hi_element = day.find('span', class_='temp-hi')
        condition_element = day.find('p', class_='phrase')
        precip_element = day.find('div', class_='precip')

        # Only proceed if all three pieces of data are found for a day
        if temp_hi_element and condition_element and precip_element:
            # Extract and clean the data
            temp_str = temp_hi_element.text.strip()
            temp_num = re.findall(r'\d+', temp_str)
            condition = condition_element.text.strip()
            precip = precip_element.text.strip()

            if temp_num:
                # Create a dictionary for the day and add it to our list
                day_data = {
                    "temperature": int(temp_num[0]),
                    "condition": condition,
                    "precipitation": precip
                }
                forecast_data.append(day_data)
                
                # Print the successfully scraped data for confirmation
                print(f"Scraped Day:")
                print(f"  High Temp: {day_data['temperature']}°C")
                print(f"  Condition: {day_data['condition']}")
                print(f"  Precipitation Chance: {day_data['precipitation']}")
                print("-" * 20)
        else:
            print("Skipping a day due to incomplete data.")

    # --- 4. Analyze the Scraped Data ---
    if not forecast_data:
        print("No complete forecast data was scraped. Cannot perform analysis.")
        return

    # Use list comprehensions to easily get lists for analysis
    temperatures = [day['temperature'] for day in forecast_data]
    conditions = [day['condition'] for day in forecast_data]

    # Calculate average temperature
    avg_temp = sum(temperatures) / len(temperatures)

    # Find the most common weather condition
    condition_counts = Counter(conditions)
    most_common_condition = condition_counts.most_common(1)[0][0]

    # --- 5. Print the Final Analysis ---
    print("\n" + "="*40)
    print("         WEATHER ANALYSIS RESULTS")
    print("="*40 + "\n")
    print(f"Analyzed {len(forecast_data)} days of complete data.")
    print(f"Average High Temperature: {avg_temp:.2f}°C")
    print(f"Most Common Weather Condition: '{most_common_condition}'")
    print("\n" + "="*40)

# Run the main function
if __name__ == "__main__":
    analyze_weather_data()