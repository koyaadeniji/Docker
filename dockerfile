# Use the official Elixir image as the base image
FROM elixir:1.13

# Set the working directory inside the container
WORKDIR /app

# Install hex package manager
RUN mix local.hex --force

# Install rebar (for Erlang projects)
RUN mix local.rebar --force

# Copy the mix.exs and mix.lock files to the container
COPY mix.exs mix.lock ./

# Install Elixir dependencies
RUN mix deps.get

# Copy the rest of the application code to the container
COPY . .

# Compile the application
RUN mix compile

# Expose the port the Phoenix app runs on (if you're using Phoenix)
EXPOSE 4000

# Set the environment to production
ENV MIX_ENV=prod

# Precompile assets (if using Phoenix)
# RUN mix phx.digest

# Build the release
RUN mix release

# Start the application
CMD ["_build/prod/rel/YOUR_APP_NAME/bin/YOUR_APP_NAME", "start"]

# Replace YOUR_APP_NAME with the actual name of your Elixir application
