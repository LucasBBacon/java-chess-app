Feature: Online Multiplayer Chess Game

  As a chess enthusiast
  I want to play chess online with other players or against AI
  So that I can enjoy the game and improve my skills

  Background:
    Given the user is logged in
    And the user is on the main game lobby

  # game creation scenarios
  Scenario: Create new game against a human opponent
    Given the user selects "Create New Game"
    When the user chooses "Casual" game mode
    And the user sets the time control to "10 minutes"
    And the user selects "Human" as the opponent type
    Then a new game room is created
    And the game room is visible in the lobby

  Scenario: Create a new game against an AI opponent
    Given the user selects "Create New Game"
    When the user chooses "Casual" game mode
    And the user sets the time control to "10 minutes"
    And the user selects "AI" as the opponent type
    And the user selects "Easy" as the AI difficulty level
    Then a new game room is created
    And the game starts immediately with the AI opponent

  Scenario: Create a new game against an AI opponent
    Given the user selects "Create New Game"
    When the user chooses "Casual" game mode
    And the user sets the time control to "10 minutes"
    And the user selects "AI" as the opponent type
    Then the user is presented with AI difficulty options: "Easy", "Medium", "Hard"
    And the user selects "Medium" as the AI difficulty level
    Then a new game room is created
    And the game starts immediately with the AI opponent set to "Medium" difficulty

  # gameplay scenarios
  Scenario: Join an existing game
    Given there is an available game in the lobby
    When the user selects the game
    And the user clicks "Join Game"
    Then the user is added to the game room
    And the game starts when both players are ready

  Scenario: Make a valid move
    Given the game has started
    And it is the user's turn
    When the user moves a pawn from "e2" to "e4"
    Then the move is validated as legal
    And the board is updated to reflect the move
    And the turn passes to the opponent

  Scenario: Attempt an invalid move
    Given the game has started
    And it is the user's turn
    When the user attempts to move a pawn from "e2" to "e5"
    Then the move is rejected as illegal
    And the board remains unchanged
    And the user is prompted to make a valid move

  Scenario: AI opponent makes a move
    Given the game has started against an AI opponent
    And it is the AI's turn
    When the AI calculates its move
    Then the AI makes a legal move
    And the board is updated to reflect the move
    And the turn passes to the user

  # game termination scenarios
  Scenario: Resign from the game
    Given the game has started
    When the user selects "Resign"
    Then the game is terminated
    And the opponent is declared the winner
    And the result is recorded in the user's history

  Scenario: Checkmate
    Given the game has started
    And the user's opponent is in checkmate
    When the user makes the winning move
    Then the game ends
    And the user is declared the winner
    And the result is recorded in the user's history

  Scenario: Stalemate
    Given the game has started
    And the user's opponent is in stalemate
    When the user makes the final move
    Then the game ends in a draw
    And the result is recorded in the user's history

  Scenario: Timeout
    Given the game has started
    And the user's time runs out
    When the clock reaches zero
    Then the game ends
    And the opponent is declared the winner
    And the result is recorded in the user's history

  # draw scenarios
  Scenario: Offer a draw
    Given the game has started
    And it is the user's turn
    When the user offers a draw
    Then the opponent is notified of the draw offer
    And the opponent can accept or decline the draw

  Scenario: AI opponent accepts a draw offer
    Given the game has started against an AI opponent
    And the user has offered a draw
    When the AI evaluates the draw offer
    And the AI accepts the draw
    Then the game ends in a draw
    And the result is recorded in the user's history

  Scenario: AI opponent declines a draw offer
    Given the game has started against an AI opponent
    And the user has offered a draw
    When the AI evaluates the draw offer
    And the AI declines the draw
    Then the game continues
    And the user is notified that the draw offer was declined

  # additional features
  Scenario: Chat with opponent
    Given the game has started
    When the user sends a message "Test message"
    Then the message is displayed in the chat window
    And the opponent can see the message

  Scenario: View game history
    Given the user has played previous games
    When the user navigates to "Game History"
    Then the user can see a list of past games
    And each game shows the result, date played, and opponent type (Human or AI)
    And each game against the AI shows the AI difficulty level

  Scenario: Reconnect to an ongoing game
    Given the user was disconnected from an ongoing game
    When the user reconnects to the game
    Then the user is returned to the same game
    And the game state is restored

  Scenario: Spectate a game
    Given there is an ongoing game in the lobby
    When the user selects "Spectate"
    Then the user can view the game in real-time
    And the user cannot make any mvoes

  Scenario: Pause the game
    Given the game has started
    When the user selects "Pause"
    Then the game is paused
    And both players are notified about the pause
    And the game can be resumed later

