from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
import pandas as pd
import time

# 1. Launch browser
service = Service()  # works if chromedriver is in PATH
driver = webdriver.Chrome(service=service)
driver.get("https://www.bbc.com/weather/293397")
time.sleep(5)  # wait for JS to load

# 2. Grab HTML and parse
soup = BeautifulSoup(driver.page_source, 'html.parser')
driver.quit()

# 3. Find daily forecast items
forecast_cards = soup.select('.wr-day')  # all daily forecast containers
weather_data = []

for card in forecast_cards:
    date = card.select_one('.wr-date__long')
    date_text = date.get_text(strip=True) if date else "N/A"

    # These may be inside aria-label attributes or span[data-testid=...]
    temp_high_elem = card.select_one('[data-testid="maximum-temperature"]')
    temp_low_elem = card.select_one('[data-testid="minimum-temperature"]')

    temp_high = temp_high_elem.get_text(strip=True) if temp_high_elem else "N/A"
    temp_low = temp_low_elem.get_text(strip=True) if temp_low_elem else "N/A"

    summary = card.select_one('.wr-day__weather-type-description')
    summary_text = summary.get_text(strip=True) if summary else "N/A"

    weather_data.append({
        'Date': date_text,
        'High Temp': temp_high,
        'Low Temp': temp_low,
        'Summary': summary_text
    })

# 4. Convert to DataFrame
df = pd.DataFrame(weather_data)
print(df)

# Optional: Save to CSV
df.to_csv("nairobi_weather.csv", index=False)
