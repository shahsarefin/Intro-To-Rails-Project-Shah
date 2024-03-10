# Dog Breeds App

## Datasets Description

### Dog API

The primary dataset for dog breeds comes from the Dog API (https://thedogapi.com). This API provides detailed information about various dog breeds, including breed names, images, and temperament. This real-time data source ensures our app's breed information is dynamic and extensive.

### Owner Data

The owner information is imported from a locally stored CSV file. This dataset includes owner names and other relevant details to simulate user interactions and ownership relationships with dog breeds.

## Database Entity-Relationship Diagram (ERD)

[ Breed ] [ Owner ]

- id (PK) - id (PK)
- name - name
- temperament - (other attributes as needed)
- image_url

[ Adoption ] (optional for future expansion)

- id (PK)
- breed_id (FK to Breed)
- owner_id (FK to Owner)
- adoption_date
