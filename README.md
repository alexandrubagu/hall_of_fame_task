# Hall of Fame Feature Design Homework

## Objective
To design and implement a "Hall of Fame" feature that tracks the highest wins in the following time frames: **All-time**, **Monthly**, **Weekly**, and **Daily** for both **games** and **users**.

- **Hall of Fame for Users**: Displayed prominently on the main page, showcasing the top-performing players across all games.
- **Hall of Fame for Games**: Displayed as a widget on each game's detail page, showing the highest wins specific to that game.

---

## Examples:

#### All-time Top Wins For A Specific Game
| Rank | Game Title      | Total Wins Amount | Top User        |
|------|-----------------|-------------------|-----------------|
| 1    | Game A          | 10000.00          | User X          |
| 2    | Game A          | 8000.00           | User Y          |
| 3    | Game A          | 7500.00           | User Z          |

#### All-time Top Wins For All Users
| Rank | Game Title      | Total Wins Amount | Top User        |
|------|-----------------|-------------------|-----------------|
| 1    | Game A          | 10000.00          | User X          |
| 2    | Game B          | 8000.00           | User Y          |
| 3    | Game C          | 7500.00           | User Z          |


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

### 3. **Sessions**
Represents gameplay sessions for users.

| Column        | Type        | Description                       |
|---------------|-------------|-----------------------------------|
| `id`          | Primary Key | Unique identifier for the session. |
| `user_id`     | Foreign Key | Links the session to a user.     |
| `game_id`     | Foreign Key | Links the session to a game.     |
| `inserted_at` | DateTime    | When the session started.        |
| `updated_at`  | DateTime    | When the session was last updated. |

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

### 5. **Bets**
Represents bets placed by users.

| Column        | Type        | Description                       |
|---------------|-------------|-----------------------------------|
| `id`          | Primary Key | Unique identifier for the bet.   |
| `amount`      | Decimal     | The amount of the bet.           |
| `user_id`     | Foreign Key | Links the bet to a user.         |
| `game_id`     | Foreign Key | Links the bet to a game.         |
| `session_id`  | Foreign Key | Links the bet to a session.      |
| `inserted_at` | DateTime    | When the bet was placed.         |
| `updated_at`  | DateTime    | When the bet was last updated.   |

---

## Evaluation Criteria

- **Correctness**: Does the solution meet the requirements?
- **Performance**: Are the queries efficient?
- **Code Quality**: Is the code clean, modular, and maintainable?
- **Scalability**: Can the solution handle a growing dataset?
- **Documentation**: Is the solution well-documented?
