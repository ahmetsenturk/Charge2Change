# Charge2Change 🚀
Charge2Change is a SwiftUI-based project that aims to incentivize Electric Vehicle (EV) owners to participate in Vehicle-to-Grid (V2G) programs. Unlike most V2G start-ups and companies, Charge2Change focuses on addressing the crucial aspect of motivating EV owners to actively engage in V2G initiatives. 💡

## Project Motivation 🌟
The primary motivation behind Charge2Change is to explore innovative ways to encourage EV owners to embrace and participate in V2G programs. While the concept of V2G holds immense potential in terms of sustainable energy management, the lack of emphasis on incentivization has been a significant hurdle in its adoption. Charge2Change seeks to bridge this gap by introducing attractive incentives and rewards for EV owners, creating a win-win scenario for both the owners and the energy grid. 🔌💰

## How to Run/Build the Project 🏃‍♂️
To run or build the Charge2Change project, you will need a Macbook with Xcode installed. If you don't have Xcode installed, you can download it from the Mac App Store for free.

Follow these steps:

1. Clone the project repository to your local machine using the following command on your terminal:
``` shell
git clone https://github.com/ahmetsenturk/Charge2Change.git
```
  You can also simply go to the [repository](https://github.com/ahmetsenturk/Charge2Change.git), click on the green **Code** button, and then select **Download ZIP**, this will automatically start the download. After unzipping the folder, you are good to go.

2. Open the project in Xcode by double-clicking on the **Charge2Change.xcodeproj** file.

3. Ensure that you have the minimum required iOS version (16.4) installed on your simulator or device.

4. Build and run the project on your preferred simulator or device by selecting the corresponding target and clicking the "Run" button in Xcode.

## Swift and SwiftUI 📚
Swift is a powerful and intuitive programming language developed by Apple. It is designed to be fast, safe, and expressive, making it an excellent choice for iOS, macOS, watchOS, and tvOS app development. SwiftUI is a declarative user interface framework introduced by Apple, enabling developers to build UIs using a simple and expressive syntax.

In Charge2Change, we leverage the capabilities of Swift and SwiftUI to create an engaging and user-friendly interface for EV owners. SwiftUI's state-driven approach simplifies the management of UI updates, making the app more efficient and responsive. Swift's type safety and modern features provide a robust foundation for implementing the app's core functionalities.

## MVVM Architecture 🏛️
Charge2Change follows the MVVM (Model-View-ViewModel) architectural pattern. This pattern helps us to separate the presentation logic from the business logic, making the codebase more maintainable and scalable.

**Model**: Represents the data and business logic of the app. It contains the underlying data structures and interacts with data sources such as APIs or databases.

**View:** Represents the user interface of the app. It is responsible for displaying the data to the user and collecting user input.

**ViewModel:** Acts as a mediator between the Model and the View. It contains the presentation logic and exposes the data from the Model to the View. It also handles user interactions and updates the Model accordingly.

By adopting the MVVM pattern, Charge2Change achieves a clean separation of concerns, allowing for easier testing, code reusability, and a more organized project structure.

## Packages Used 📦
Charge2Change utilizes the following third-party package:

TouchVisualizer (Version 1.0.1): A package that enables touch visualization for enhanced user experience.

## Remarks 📝
All data used in this project is purely mocked and for demonstration purposes only. The primary aim is to showcase the functionality and potential of incentivizing EV owners to participate in V2G programs. Please do not use this data for any real-world analysis or decision-making.

## Requirements 📋
iOS 16.4 or later

## Contributing 🤝
We welcome contributions from anyone interested in enhancing the Charge2Change project! If you have any suggestions, bug reports, or feature requests, please feel free to open an issue or submit a pull request on our GitHub repository. Let's collaborate and make V2G participation more rewarding for EV owners together! 🙌

## License 📄
Charge2Change is released under the MIT License. Feel free to use, modify, and distribute the project as per the terms and conditions of the license.

## Acknowledgments 🙏
We would like to express our gratitude to all the contributors who have helped shape and improve the Charge2Change project.
