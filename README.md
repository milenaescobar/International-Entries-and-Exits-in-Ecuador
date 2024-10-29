# International Migration Analysis in Ecuador (2023)

Milena Escobar, Anna Belén Marcillo, Marjorie Ortiz

This repository contains an analysis of the factors influencing international migration in Ecuador during 2023. The analysis is based on data from the International Entry and Exit Registry (ESI) provided by INEC. This README provides an overview of the repository contents and instructions on how to run the analysis.

## Repository Contents

- **Data**: Cleaned dataset in Stata format.
- **Scripts**: Stata scripts for data cleaning, logistic regression models, t-tests, proportion tests, and simulations.
- **Report**: A comprehensive PDF report detailing the research process.
- **Presentation**: Slides summarizing the key findings and policy recommendations.

## Getting Started

### Prerequisites
To run the analysis on a fresh computer, you'll need:
- **Stata** installed for data analysis.
- The following Stata packages: `estout`, `gtools`.

Ensure that you have the necessary packages installed before running the scripts. 

### Directory Structure
The repository uses relative file paths, so please clone the entire repository to ensure all files are properly linked:
```bash
git clone https://github.com/milenaescobar/International-Entries-and-Exits-in-Ecuador.git
```

After cloning, you should see the following structure:
```
project/
├── data/
│   ├── cleaned_data.dta
├── scripts/
│   ├── analysis.R
├── report/
│   ├── report.pdf
├── presentation/
│   ├── slides.pdf
└── README.md
```

## Running the Analysis

This will execute all the necessary scripts in the correct order, ensuring a reproducible workflow.

## Version Control
Plenty of commits with meaningful titles are included in the GitHub repository to help keep track of the analysis process and allow easy reversion to previous states if needed.

## Reproducibility
The analysis has been designed to be reproducible on a fresh computer with minimal setup. Please ensure that Stata and the necessary packages are installed before running the master script. 
