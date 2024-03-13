# Dataset Overview

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
