# Building Modular REST APIs with Rails

A Rails API project that implements a versioned JSON REST API for core blogging resources: users, posts, and comments.

## Project Status

Current implementation includes:

- API versioning with `api/v1` namespace
- Full CRUD endpoints for `users`, `posts`, and `comments`
- JSON responses for all API actions
- Active Record associations with dependent cleanup
- Model-level validations for required fields and constraints
- Basic model tests for primary validation scenarios

## Tech Stack

- Ruby on Rails `8.1.3`
- SQLite (development and test)
- Puma application server
- Minitest test framework

## Domain Model

- `User`
  - has many `posts`
  - has many `comments`
  - validations: name presence, email presence/uniqueness/format
- `Post`
  - belongs to `user`
  - has many `comments`
  - validations: title presence, content presence and length
- `Comment`
  - belongs to `user`
  - belongs to `post`
  - validation: comment presence

## API Endpoints (v1)

Base path: `/api/v1`

### Users

- `GET /users`
- `GET /users/:id`
- `POST /users`
- `PATCH /users/:id`
- `DELETE /users/:id`

### Posts

- `GET /posts`
- `GET /posts/:id`
- `POST /posts`
- `PATCH /posts/:id`
- `DELETE /posts/:id`

### Comments

- `GET /comments`
- `GET /comments/:id`
- `POST /comments`
- `PATCH /comments/:id`
- `DELETE /comments/:id`

## Getting Started

### Prerequisites

- Ruby (compatible with Rails `8.1.3`)
- Bundler
- SQLite3

### Setup

```bash
bundle install
bin/rails db:create
bin/rails db:migrate
```

### Run the Server

```bash
bin/rails server
```

The API will be available at `http://localhost:3000`.

## Run Tests

```bash
bin/rails test
```

## Notes

- API responses are JSON by default under the `api` namespace.

