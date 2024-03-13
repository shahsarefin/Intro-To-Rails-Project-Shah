# Dataset Overview - Dog Breeds App

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

# Database Text ERD(ERD Diagram picture included in the app folder)

## Breeds

| Attribute                             | Type      | Description                                                    |
| ------------------------------------- | --------- | -------------------------------------------------------------- |
| id                                    | integer   | A unique identifier for each breed.                            |
| name                                  | string    | The name of the breed.                                         |
| temperament                           | text      | Descriptive text about the breed's behavior.                   |
| created_at                            | datetime  | Timestamp indicating when the breed record was created.        |
| updated_at                            | datetime  | Timestamp indicating when the breed record was last updated.   |
| --------------                        | --------- | --------------------------------------------------             |
| has_many :adoptions                   |           | Indicates that a breed can have many adoptions.                |
| has_many :owners, through: :adoptions |           | Indicates that a breed can have many owners through adoptions. |

## Owners

| Attribute                             | Type      | Description                                                     |
| ------------------------------------- | --------- | --------------------------------------------------------------- |
| id                                    | integer   | A unique identifier for each owner.                             |
| name                                  | string    | The owner's full name.                                          |
| email                                 | string    | The owner's email address.                                      |
| phone_number                          | string    | The owner's phone number.                                       |
| address                               | string    | The physical address of the owner.                              |
| created_at                            | datetime  | Timestamp indicating when the owner record was created.         |
| updated_at                            | datetime  | Timestamp indicating when the owner record was last updated.    |
| --------------                        | --------- | --------------------------------------------------              |
| has_many :adoptions                   |           | Indicates that an owner can have many adoptions.                |
| has_many :breeds, through: :adoptions |           | Indicates that an owner can have many breeds through adoptions. |

## Adoptions

| Attribute         | Type       | Description                                                     |
| ----------------- | ---------- | --------------------------------------------------------------- |
| id                | integer    | A unique identifier for each adoption record.                   |
| breed_id          | integer    | Foreign key linking to the adopted pet's breed.                 |
| owner_id          | integer    | Foreign key linking to the adopting owner.                      |
| adoption_date     | date       | The date when the adoption took place.                          |
| created_at        | datetime   | Timestamp indicating when the adoption record was created.      |
| updated_at        | datetime   | Timestamp indicating when the adoption record was last updated. |
| --------------    | ---------- | --------------------------------------------------              |
| belongs_to :breed |            | Indicates that an adoption belongs to a specific breed.         |
| belongs_to :owner |            | Indicates that an adoption belongs to a specific owner.         |
