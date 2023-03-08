# Set up initial game parameters
player_distance <- 0
obstacle_distance <- 20
game_over <- FALSE

# Define functions for game mechanics
move_player <- function(distance) {
  player_distance <<- player_distance + distance
  cat(sprintf("You ran %d meters.\n", distance))
}

generate_obstacle <- function() {
  obstacle_distance <<- sample(20:50, 1)
  cat(sprintf("An obstacle is %d meters ahead!\n", obstacle_distance))
}

jump_over_obstacle <- function() {
  if (player_distance + 10 >= obstacle_distance) {
    cat("You jumped over the obstacle!\n")
  } else {
    cat("You did not jump over the obstacle and fell!\n")
    game_over <<- TRUE
  }
}

slide_under_obstacle <- function() {
  if (player_distance + 5 >= obstacle_distance) {
    cat("You slid under the obstacle!\n")
  } else {
    cat("You did not slide under the obstacle and hit it!\n")
    game_over <<- TRUE
  }
}

# Start the game loop
while (!game_over) {
  # Print current state of player
  cat(sprintf("Current distance: %d meters.\n", player_distance))
  
  # Generate obstacle randomly
  if (player_distance >= obstacle_distance) {
    generate_obstacle()
    # Prompt user for action
    user_input <- readline(prompt = "What would you like to do? (jump, slide) ")
    # Execute user's choice
    if (user_input == "jump") {
      jump_over_obstacle()
    } else if (user_input == "slide") {
      slide_under_obstacle()
    }
  }
  
  # Move the player forward
  move_player(sample(10:20, 1))
  
  # Check if game is over
  if (player_distance >= 100) {
    cat("You reached the end of the temple run and won!\n")
    break
  }
}
