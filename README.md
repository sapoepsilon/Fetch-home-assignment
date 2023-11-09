# Fetch-home-assignment app

This iOS app allows users to browse and view details of dessert recipes using TheMealDB API. Users can see a list of dessert meals and select one to view its detailed information, including name, instructions, and ingredients with measurements.

## Features

- Fetch and display a list of desserts in alphabetical order.
- Show detailed information for a selected dessert.
- Handle null or empty values gracefully.

## Installation

Clone the repository:

    git clone https://github.com/sapoepsilon/Fetch-home-assignment.git

Navigate to the cloned directory:

    cd Fetch-home-assignment

Open the project in Xcode:

    open Fetch-home-assignment.xcodeproj

Build and run the app in your simulator or on your device.

## Usage

Upon launching the app, you will be presented with a list of desserts. You can select any dessert to view its details.

## Project Structure

- `Model`: Contains the data model for the Meal and its details.
- `View`: Contains the SwiftUI views for the meal list and detail screen.
- `ViewModel`: Contains the view models that fetch data from the API.
- `Service`: Handles API requests and responses.
- `Utilities`: Includes any helpers or extension methods.

## API Reference

This app uses the following endpoints from TheMealDB API:

- List of meals in the Dessert category: `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert`
- Meal details by its ID: `https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID`
