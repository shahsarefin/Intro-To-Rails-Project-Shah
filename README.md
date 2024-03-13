# AdoptADog Project

## Introduction

AdoptADog is a web application aimed at facilitating the adoption process for dogs. It provides a platform where users can explore different dog breeds, learn about their characteristics, and find dogs available for adoption. The application also assists in connecting potential adopters with the right pets and provides information about the adoption process.

## Features

- **Browse Dog Breeds:** Users can browse a list of dog breeds to learn about their characteristics, temperament, and suitability as pets.
- **Detailed Breed Information:** Detailed information is provided for each breed, including their history, physical traits, and temperament.

- **Search Functionality:** Users can search for specific dog breeds by name using the search feature.

- **Adoption Information:** The application offers information about the adoption process, including adoption requirements, procedures, and available dogs for adoption.

## Technologies Used

The AdoptADog web application is built using the following technologies:

- **Ruby on Rails:** The framework used for developing the backend logic and handling web requests.
- **Bootstrap:** The frontend framework used for designing responsive and visually appealing user interfaces.

# Dataset Overview - AdoptADog

The dataset comprises three primary entities: Breeds, Owners, and Adoptions. These entities are interconnected through associations that represent the real relationships between pet breeds, their owners, and the adoptions that link them.

## Breeds

- **Description**: This entity represents different types of pet breeds. Each breed has its unique characteristics, which are captured by attributes such as name and temperament.
- **Data Source 1 - For Breeds:**
  - For Breeds, we are using the [Dog CEO Dog API](https://dog.ceo/dog-api/).

## Owners

- **Description**: Owners are individuals who adopt pets. This entity stores their personal information, which includes contact details and address.
- **Data Source 2 - For Owners:**
  - For Owners, we are using a CSV file called `owners.csv` located in the `db` folder.

## Adoptions

- **Description**: This entity records the adoption of a pet by an owner. It serves as a join table between Breeds and Owners, indicating which owner has adopted a pet of a specific breed and when the adoption occurred.
- **Data Source 3 - For Adoption:**
  - For the Adoption model, we are generating data using the Faker gem.

## Setup Instructions

To set up the AdoptADog project locally, follow these steps:

- **Clone the Repository:**
- git clone <repository_url>

- **Navigate to the Project Directory:**

- cd AdoptADog

- **Install Dependencies:**

- bundle install

- **Set Up the Database:**

- rails db:create
- rails db:migrate

- **Seed the Database:**

- rails db:seed

- **Start the Rails Server:**

- rails server

- **Access the Application:**
- Open your web browser and visit [http://localhost:3000](http://localhost:3000)
  to access the AdoptADog application.
