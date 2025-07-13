import time
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from bs4 import BeautifulSoup
from collections import defaultdict
from datetime import datetime

# --- 1. Set up Selenium WebDriver with a Manual Path ---

# IMPORTANT: This path MUST be correct.
# Verify it by pasting it into your Windows File Explorer address bar.
DRIVER_PATH = "C:/Users/vickg/OneDrive/Documents/chromedriver-win64/chromedriver-win64/chromedriver.exe"

# The URL for the news section to scrape
URL = "https://news.google.com/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRGx1YlY4U0FtVnVHZ0pKVGlnQVAB?hl=en-US&gl=US&ceid=US%3Aen"

# Initialize the Service object with the explicit path to your driver
service = Service(executable_path=DRIVER_PATH)

# Initialize the driver. The 'driver' variable will be used to control the browser.
driver = webdriver.Chrome(service=service)

# Use a try...finally block to ensure the browser is always closed, even if errors occur.
try:
    # --- 2. Navigate to the Page and Extract HTML ---
    print(f"Navigating to: {URL}")
    driver.get(URL)

    # Give the page a few seconds to load its dynamic content via JavaScript.
    print("Waiting for JavaScript to load articles...")
    time.sleep(5)

    # Get the page source after JavaScript has rendered the content
    print("Extracting page source...")
    html_content = driver.page_source

finally:
    # --- This block always runs, ensuring the browser is closed ---
    print("Closing the browser.")
    driver.quit()


# --- 3. Parse the HTML with BeautifulSoup ---
print("Parsing the extracted HTML...")
soup = BeautifulSoup(html_content, 'html.parser')

# --- 4. Extract, Process, and Categorize Articles ---

# Use defaultdict to easily group articles by month.
# If a month key doesn't exist, it automatically creates a new list for it.
categorized_articles = defaultdict(list)

# Based on inspection of Google News, articles are contained within <article> tags.
articles = soup.find_all('article')
print(f"Found {len(articles)} potential articles on the page.")

for article in articles:
    # Find the article title. It's typically within an <h3> tag.
    title_element = article.find('h3')
    title = title_element.text.strip() if title_element else 'Title Not Found'

    # Find the publication date. Dates are in a <time> tag with a 'datetime' attribute.
    date_element = article.find('time')

    if date_element and date_element.has_attr('datetime'):
        date_str = date_element['datetime']
        try:
            # Parse the standard ISO format date string (e.g., '2024-05-20T14:30:00Z')
            # The 'Z' at the end means UTC, so we replace it for compatibility.
            publication_date = datetime.fromisoformat(date_str.replace('Z', '+00:00'))

            # Get the full month name (e.g., 'January', 'February')
            month_name = publication_date.strftime('%B')

            # Add the title to the list for that month.
            categorized_articles[month_name].append(title)

        except ValueError:
            # This will catch any dates that are not in the expected format.
            print(f"Could not parse date for article: {title}")


# --- 5. Print the Final Categorized Lists ---
print("\n" + "="*40)
print("      CATEGORIZED NEWS ARTICLES")
print("="*40 + "\n")

if categorized_articles:
    # Sort months for a consistent output (optional but good practice)
    # This requires converting month names to numbers for correct chronological order.
    sorted_months = sorted(categorized_articles.keys(), key=lambda m: datetime.strptime(m, "%B").month)

    for month in sorted_months:
        titles = categorized_articles[month]
        print(f"--- Articles for {month} ---")
        for i, title in enumerate(titles, 1):
            print(f"  {i}. {title}")
        print("-" * (len(month) + 21) + "\n")
else:
    print("No articles with valid publication dates were found to categorize.")