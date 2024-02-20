# TR STORE

- [TR STORE](#tr-store)
    - [Introduction](#introduction)
    - [Setbacks](#setbacks)
    - [Features](#features)
    - [Application Workflow](#application-workflow)
    - [Project Structure](#project-structure)
    - [Possible and/or Future Improvements](#possible-andor-future-improvements)
  
### Introduction

This is a small demo project, showing how to make a offline first app, that will work on rural areas, where internet connection won't always be available. And It's attempted to make simple and minimalistic to work on low powered devices.

> [!NOTE] 
>  This project uses it's `Drift` local database as the source of truth, for the whole app state.



### Setbacks
1. This project was made in a rush, with a certain time constraints.
2. The APIs used on this project did not support pagination. Which is kind of a crucial in this case. To get chunks of data and store/cache and update them chunk by chunk.
3. I used `Drift` as the local database because it uses the `sql` database most of the platforms provide. Which is really performant and efficient. And I used the supper famous `Riverpod` as state management system. But both of them is kinda new to me, specially `Drift`. It's the very first time I tried it. But I wanted to explore them in this project.

### Features
This is a very small and minimal project containing few simple features -
1. Get **Product** list from a demo API.
2. Show product **Description** when a product is clicked.
3. And give user a **Cart** to add products.
4. Also, there's a alert feature for the user that uses a **Network Stream** and alerts if the he's on offline mode or not.

### Application Workflow
The application works in the following manner -
* When the App opens, the very first thing it attempts to do, is get the `Product` list from the API.
* But if there's no network connection on the first run, it will only show an empty state. Which is the actual state of the local database.
* If Internet connection is available or when ever the user connects to the network again, It fetches all the data and stores it inside the local data base.
* Then it shows a product list in a `ListView` while caching the product `thumbnails`.
* Whenever the connection state updates, it attempts to update the local database with the fresh API data.
* The app tries to keep the product up-to-date with the actual API whenever you interact with a product.
* You can add a product to cart from the `Product Page`. And it will mark that product as `inCart` inside the local database. As there's no separate API for cart.
*  And whenever you click a product, it again tries to fetch that specific product data and make sure it's up-to-date with the actual data. Also caches the `productImage` if the network is available. Also that state is cached by `Riverpod`.
*  And finally the `Cart` just shows you the list of all the products that's marked as `inCart` in the local database.
   
### Project Structure
It's a `Feature Based` folder structure. And tries to follows the `Clean Code Architecture`. Following is the `lib` structure of the project -
```
| |--->lib
| | |--->main.dart
| | |--->src
| | | |--->constants
| | | | |--->design
| | | | | |--->paddings.dart
| | | | | |--->border_radius.dart
| | | | |--->assets
| | | | | |--->assets.dart
| | | |--->features
| | | | |--->homepage
| | | | | |--->controllers
| | | | | | |--->homepage_controller.dart
| | | | | |--->views
| | | | | | |--->homepage.dart
| | | | | | |--->widgets
| | | | | | | |--->single_product.dart
| | | | | | | |--->single_product_shimmer.dart
| | | | |--->details
| | | | | |--->controllers
| | | | | | |--->details_controller.dart
| | | | | |--->views
| | | | | | |--->details_page.dart
| | | | |--->cart
| | | | | |--->controllers
| | | | | | |--->cart_controller.dart
| | | | | |--->views
| | | | | | |--->cart_page.dart
| | | |--->utilities
| | | | |--->extensions
| | | | | |--->size_utilities.dart
| | | | | |--->date_time_extensions.dart
| | | | | |--->async_utils.dart
| | | | | |--->list_extensions.dart
| | | | | |--->string_extensions.dart
| | | | |--->scaffold_utils
| | | | | |--->snackbar_util.dart
| | | |--->data
| | | | |--->models
| | | | | |--->product
| | | | | | |--->product_model.dart
| | | | |--->products_provider
| | | | | |--->products_provider.dart
| | | |--->domain
| | | | |--->server
| | | | | |--->config
| | | | | | |--->request_handler.dart
| | | | | | |--->api
| | | | | | | |--->api_config.dart
| | | | | |--->product_repository
| | | | | | |--->product_repo.dart
| | | | | | |--->models
| | | | | | | |--->post
| | | | | | | | |--->product_data_model.dart
| | | | |--->local
| | | | | |--->config
| | | | | | |--->database
| | | | | | | |--->database_config.dart
| | | | | | |--->database_provider.dart
| | | | | |--->product_repository
| | | | | | |--->tables
| | | | | | | |--->products_table.dart
| | | | | | |--->product_repo.dart
| | | | | | |--->daos
| | | | | | | |--->product_dao.dart
| | | |--->app.dart
| | | |--->services
| | | | |--->connection
| | | | | |--->connection_state_provider.dart
| | | | | |--->connection_msg_wrapper.dart
| | | | |--->theme
| | | | | |--->extensions
| | | | | | |--->extensions.dart
| | | | | | |--->colors_theme.dart
| | | | | |--->app_theme.dart
| | | | |--->router
| | | | | |--->routes.dart
```
### Possible and/or Future Improvements
These are some of the improvements, that I think would be a bit better for this project. And I'm hoping to make the changes in future.
1. Using the `Drift` watch table API to, to control the whole apps state. It would have been much easier to maintain.
2. The `Riverpod` caching and listening is something I'm not so sure about. I feel like it could have been better if I had more experience with the package.
3. And some more UI and feature improvements maybe.

And that's all for this project. Thanks a bunch. 💙

