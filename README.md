# Dog Breeds App

### Dataset Overview

The dataset comprises three primary entities: `Breeds`, `Owners`, and `Adoptions`. These entities are interconnected through associations that represent the real-world relationships between pet breeds, their owners, and the adoptions that link them.

### Breeds

- **Description**: This entity represents different types of pet breeds. Each breed has its unique characteristics, which are captured by attributes such as `name` and `temperament`.
- **Attributes**:
  - `id`: A unique identifier for each breed.
  - `name`: The name of the breed.
  - `temperament`: Descriptive text about the breed's general behavior and personality traits.
  - `created_at` & `updated_at`: Timestamps that track when the breed record was created and last updated.

### Owners

- **Description**: Owners are individuals who adopt pets. This entity stores their personal information, which includes contact details and address.
- **Attributes**:
  - `id`: A unique identifier for each owner.
  - `name`: The owner's full name.
  - `email`: The owner's email address.
  - `phone_number`: The owner's phone number.
  - `address`: The physical address of the owner.
  - `created_at` & `updated_at`: Timestamps that track when the owner record was created and last updated.

### Adoptions

- **Description**: This entity records the adoption of a pet by an owner. It serves as a join table between `Breeds` and `Owners`, indicating which owner has adopted a pet of a specific breed and when the adoption occurred.
- **Attributes**:
  - `id`: A unique identifier for each adoption record.
  - `breed_id`: A foreign key that links to the adopted pet's breed.
  - `owner_id`: A foreign key that links to the adopting owner.
  - `adoption_date`: The date when the adoption took place.
  - `created_at` & `updated_at`: Timestamps that track when the adoption record was created and last updated.

### Associations

- **Breeds and Adoptions**: A one-to-many relationship, where one breed can be associated with many adoptions.
- **Owners and Adoptions**: A one-to-many relationship, where one owner can have many adoptions.
- **Breeds and Owners through Adoptions**: A many-to-many relationship facilitated by the `Adoptions` entity. This indicates that owners can adopt pets of many breeds and that breeds can be adopted by many owners.

This dataset allows the application to manage and track the adoption of pets, linking them to their new owners and recording important details about each transaction.
