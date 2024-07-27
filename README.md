# Recipe Ripper
No more scrolling, cooking

## Description
Recipe Ripper is a webapp that scrapes recipe webpages and returns just a recipe.
This is a basic version of the app, that scrapes html sites. Future versions will cover a wider range of pages. 

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [Contact](#contact)

## Installation

1.  Clone the repository:
 `git clone https://github.com/jrzricardo/recipe_ripper.git`

2.  Navigate to the project directory:
`cd recipe_ripper`

3.  Install the following required gems:
- `gem "nokogiri"`
- `gem "httparty"`
`bundle install`

4.  Set up the database:
`rails db:setup`

5.  Start the Rails server:
`rails server`

## Usage

1.  Start the Rails server:
`rails server`

2. Open your browser and navigate to http://localhost:3000

3. Enter a website URL address in the search form.

4. Recipe Ripper will return a recipe if one is present. 

## Contributing

Contributions are welcome and appreciated!
Please follow these guidelines:

1. Fork the repository

2. Create a new branch (`git checkout -b feature-branch`)

3. Commit your changes (`git commit -m 'Add some feature'`)

4. Push to the branch (`git push origin feature-branch`)

5. Open a pull request

## Contact

Ricardo Juarez - [rjuarez@illinois.edu] (mailto:rjuarez@illinois.edu)
Project Link: [https://github.com/jrzricardo/recipe-ripper]
(https://github.com/jrzricardo/recipe-ripper)
