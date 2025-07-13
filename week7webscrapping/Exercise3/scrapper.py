from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from bs4 import BeautifulSoup
import time

# --- 1. Set up Selenium WebDriver ---
# Path to your WebDriver
DRIVER_PATH = "C:/Users/vickg/OneDrive/Documents/chromedriver-win64/chromedriver-win64/chromedriver.exe"
service = Service(executable_path=DRIVER_PATH)
driver = webdriver.Chrome(service=service)

# The URL you are targeting
url = "https://www.rottentomatoes.com/browse/movies_in_theaters/sort:popular"

# --- 2. Navigate to the page and get HTML source ---
print(f"Navigating to {url}...")
driver.get(url)

# Give the page time to load its dynamic content
# This is crucial for pages that load content with JavaScript
print("Waiting for dynamic content to load...")
time.sleep(5)

# Get the page source after JavaScript has rendered
print("Extracting page source...")
html_content = driver.page_source

# --- A useful debugging step (optional) ---
# This saves the HTML that Selenium sees to a file, so you can inspect it.
# with open("rottentomatoes_page.html", "w", encoding="utf-8") as f:
#     f.write(html_content)

# Close the browser
driver.quit()

# --- 3. Parse the HTML with BeautifulSoup ---
print("Parsing HTML with BeautifulSoup...")
soup = BeautifulSoup(html_content, 'html.parser')

# --- 4. Find and extract movie information using CORRECT selectors ---
# Find the container for all the movie tiles
movie_container = soup.find('div', class_='discovery-tiles')

if movie_container:
    # Find all the individual movie tiles within the container
    movie_tiles = movie_container.find_all('div', class_='discovery-tiles__tile')
    print(f"Found {len(movie_tiles)} movie tiles.")

    # --- 5. Print the extracted data ---
    for tile in movie_tiles:
        # Find the title element within the tile
        title_element = tile.find('span', {'data-qa': 'discovery-media-list-item-title'})
        title = title_element.text.strip() if title_element else 'Title Not Found'

        # Find the score element. The score is an attribute on the score-pairs-deprecated tag.
        score_element = tile.find('score-pairs-deprecated')
        score = score_element['criticsscore'] if score_element and 'criticsscore' in score_element.attrs else 'N/A'

        print(f"Title: {title}")
        print(f"Rotten Tomatoes Score: {score}%")
        print("-" * 20)

else:
    # This message will now print if the main 'discovery-tiles' container isn't found
    print("Could not find the main movie container. The website layout may have changed again.")