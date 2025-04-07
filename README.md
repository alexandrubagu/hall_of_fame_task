# Hall of Fame Feature - Design Homework

## Examples:

![2025-03-27_14-21](https://github.com/user-attachments/assets/beca0e1b-c73e-48a9-b797-e774994da658)

---
## Functional Requirements

* The system should track the top 10 highest wins for different timeframes: All-time, Monthly, Weekly, and Daily.
* A Hall of Fame widget should be available to display the leaderboard.
* Users should be able to see the game title, username, and win amount for each entry.
* The leaderboard should update in real-time when a new win is recorded.
* The system should handle win retrieval efficiently to avoid performance bottlenecks.

Non-Functional Requirements
* The system should be highly available to ensure that the leaderboard is always accessible.
* Query performance should be optimized using indexes and caching for frequent leaderboard queries.
* The data aggregation should be efficient to avoid slow queries, especially for real-time updates.
* The solution should scale well with increasing numbers of users and wins.
* Data should be stored and retrieved efficiently, considering partitioning if needed for large datasets.
---
