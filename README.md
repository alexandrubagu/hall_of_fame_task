# Hall of Fame Feature Design Homework

## Objective
To design and implement a "Hall of Fame" widget that tracks the top 10 highest wins for the following time frames: **All-time**, **Monthly**, **Weekly**, and **Daily**.

---

## Examples:

![2025-03-27_14-21](https://github.com/user-attachments/assets/beca0e1b-c73e-48a9-b797-e774994da658)


---

## Tables Overview

### 1. **Users**
Represents the players in the system.

| Column        | Type        | Description                       |
|---------------|-------------|-----------------------------------|
| `id`          | Primary Key | Unique identifier for the user.  |
| `name`        | String      | Name of the user.                |
| `email`       | String      | Email address of the user.       |
| `inserted_at` | DateTime    | When the user was created.       |
| `updated_at`  | DateTime    | When the user was last updated.  |

---

### 2. **Wins**
Represents wins made by users during gameplay.

| Column        | Type        | Description                       |
|---------------|-------------|-----------------------------------|
| `id`          | Primary Key | Unique identifier for the win.   |
| `amount`      | Decimal     | The amount won.                  |
| `user_id`     | Foreign Key | Links the win to a user.         |
| `game_id`     | Foreign Key | Links the win to a game.         |
| `bet_id`      | Foreign Key | Links the win to a bet.          |
| `session_id`  | Foreign Key | Links the win to a session.      |
| `inserted_at` | DateTime    | When the win was recorded.       |
| `updated_at`  | DateTime    | When the win was last updated.   |

---

### 4. **Games**
Represents games available in the system.

| Column        | Type        | Description                       |
|---------------|-------------|-----------------------------------|
| `id`          | Primary Key | Unique identifier for the game.  |
| `title`       | String      | The title of the game.           |
| `rtp`         | Decimal     | Return to player percentage.     |
| `status`      | String      | The status of the game (e.g., active/inactive). |
| `media`       | String      | Media URL for the game.          |
| `slug`        | String      | Slug for identifying the game.   |
| `themes`      | String      | Themes associated with the game. |
| `inserted_at` | DateTime    | When the game was created.       |
| `updated_at`  | DateTime    | When the game was last updated.  |

---

## Evaluation Criteria

- **Correctness**: Does the solution meet the requirements?
- **Performance**: Are the queries efficient?
- **Code Quality**: Is the code clean, modular, and maintainable?
- **Scalability**: Can the solution handle a growing dataset?
- **Documentation**: Is the solution well-documented?
