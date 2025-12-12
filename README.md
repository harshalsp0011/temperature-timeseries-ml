# Short-Term Temperature Forecasting using ARIMA and LSTM

## 📋 Project Overview

This is a comprehensive time series forecasting project that compares **ARIMA (AutoRegressive Integrated Moving Average)** and **LSTM (Long Short-Term Memory)** neural networks for predicting short-term temperature changes across US cities. The project combines statistical analysis with deep learning approaches to determine optimal forecasting methodologies.

**Course:** Statistics Project (STAT)  
**Team:** Team 12  
**University:** University at Buffalo  
**Date:** 2024

---

## 🎯 Project Objectives

1. **Data Analysis:** Conduct exploratory data analysis on US city temperature datasets
2. **Model Development:** Implement and optimize both ARIMA and LSTM forecasting models
3. **Comparative Analysis:** Benchmark model performance using statistical metrics
4. **Documentation:** Provide comprehensive technical and statistical documentation
5. **Validation:** Validate forecasts against real-world temperature patterns

---

## 📁 Project Structure

```
.
├── 01_Source_Code/                 # All source code files
│   ├── Python/                     # Python implementations
│   │   └── PyCode_Stat.ipynb      # Main Python analysis notebook
│   └── R_Code/                     # R implementations
│       ├── Team12Code.Rmd         # Main R analysis document
│       ├── data_preparation.R     # Data cleaning and preparation
│       └── data_preparation-Siddhi-Acer-Aspire-7.R  # Variant
│
├── 02_Data/                        # Data storage
│   ├── Raw/                        # Raw unprocessed data
│   │   └── US_City_Temp_Data.csv  # Original temperature dataset
│   └── Processed/                  # Cleaned and transformed data
│
├── 03_Documentation/               # Project documentation
│   ├── Meeting_Notes/              # Team meeting notes
│   └── Progress_Reports/           # Progress updates
│       └── Progress Report.pdf     # Latest progress report
│
├── 04_Reports/                     # Final deliverables
│   ├── Final_Reports/              # Completed reports and analysis
│   │   ├── final report Time Series Analysis.docx
│   │   ├── Team12eport.pdf
│   │   ├── group project.pdf
│   │   ├── Paper_33-Time_Series_Forecasting_using_LSTM_and_ARIMA.pdf
│   │   └── Weather_Forecasting_Using_Spatial_Feature_Based_LS.pdf
│   └── Proposals/                  # Project proposals
│       ├── Team 12 Proposal.docx
│       └── team12proposal.docx
│
├── 05_Research_Papers/             # Reference literature
│   ├── Harshal/                    # Harshal's research papers
│   │   ├── Forecasting_daily_meteorologic.pdf
│   │   ├── GRET2023-325-333.pdf
│   │   └── ijis_2020061115391787.pdf
│   ├── Mrudula/                    # Mrudula's research papers
│   │   ├── Applying Bayesian inference in a hybrid CNN-LSTM model.pdf
│   │   ├── Enhancing_Stock_Price_Prediction_Method_Based_on_C.pdf
│   │   └── Weather_prediction_using_CNN-LSTM_for_time_series_.pdf
│   └── Sidhhi/                     # Sidhhi's research papers
│       ├── 1.2011.04452v1.pdf
│       ├── 2.10186768.pdf
│       ├── 3.jcssp.2018.930.938.pdf
│       ├── A_Comparative_Analysis_of_the_ARIMA_and_LSTM_Predi.pdf
│       ├── Comparison_of_ARIMA_and_Artificial_Neural_Networks.pdf
│       └── Paper_33-Time_Series_Forecasting_using_LSTM_and_ARIMA.pdf
│
├── 06_Presentations/               # Presentation materials
│   └── Project_Poster_Template.pptx
│
├── .archive/                       # Old/deprecated files
│   └── [Legacy project files]
│
├── .git/                           # Git version control
├── .gitattributes                  # Git configuration
└── README.md                       # This file
```

---

## 🚀 Getting Started

### Prerequisites
- **Python 3.7+** with libraries: pandas, numpy, scikit-learn, TensorFlow/Keras, statsmodels
- **R 4.0+** with packages: forecast, lubridate, ggplot2, tidyverse
- Jupyter Notebook or RStudio for interactive development

### Installation

1. **Clone the repository:**
   ```bash
   git clone [repository-url]
   cd short-term-temp-forcast-ARIMA-LSTM-Statistic
   ```

2. **Set up Python environment:**
   ```bash
   pip install pandas numpy scikit-learn tensorflow statsmodels matplotlib seaborn
   ```

3. **Set up R environment:**
   ```r
   install.packages(c("forecast", "lubridate", "ggplot2", "tidyverse"))
   ```

### Running the Analysis

**Python Implementation:**
```bash
jupyter notebook 01_Source_Code/Python/PyCode_Stat.ipynb
```

**R Implementation:**
```r
# Open in RStudio
rmarkdown::render('01_Source_Code/R_Code/Team12Code.Rmd')
```

---

## 📊 Methodology

### Data
- **Source:** US City Temperature Dataset
- **Variables:** Temperature readings, temporal features, city locations
- **Time Period:** [Specify date range from your data]
- **Frequency:** [Daily/Weekly/Monthly]

### Approaches

#### 1. **ARIMA Modeling**
- Stationarity testing (ADF, KPSS tests)
- ACF/PACF analysis for order selection
- Parameter optimization (p, d, q)
- Diagnostic checking and model validation

#### 2. **LSTM Neural Network**
- Sequence-to-sequence architecture
- Multiple layers with dropout regularization
- Time series windowing and normalization
- Training with validation and test sets

### Evaluation Metrics
- **Mean Absolute Error (MAE)**
- **Root Mean Squared Error (RMSE)**
- **Mean Absolute Percentage Error (MAPE)**
- **Diebold-Mariano Test** for statistical significance
- **Residual Analysis** for model diagnostics

---

## 📈 Key Findings

[Add specific results from your analysis here - RMSE, MAPE, model comparison, etc.]

---

## 👥 Team Members & Contributions

| Member | Role | Contributions |
|--------|------|---|
| Harshal | | Weather forecasting research, meteorological analysis |
| Mrudula | | CNN-LSTM hybrid approaches, Bayesian methods |
| Sidhhi | | ARIMA comparative analysis, comprehensive literature review |

---

## 📚 Research References

### Key Papers
- Time Series Forecasting using LSTM and ARIMA (Paper_33)
- Weather Forecasting Using Spatial Features
- Comparative Analysis of ARIMA and LSTM Predictions
- CNN-LSTM Hybrid Methods for Time Series
- Bayesian Inference in Neural Networks

**See [05_Research_Papers](05_Research_Papers/) for full reference collection**

---

## 📝 Documentation

- **Progress Reports:** [03_Documentation/Progress_Reports/](03_Documentation/Progress_Reports/)
- **Meeting Notes:** [03_Documentation/Meeting_Notes/](03_Documentation/Meeting_Notes/)
- **Final Report:** [04_Reports/Final_Reports/](04_Reports/Final_Reports/)
- **Proposals:** [04_Reports/Proposals/](04_Reports/Proposals/)

---

## 🔧 Technical Stack

| Component | Technology |
|-----------|-----------|
| Data Processing | Python (pandas, numpy) / R (tidyverse) |
| Statistical Modeling | statsmodels (Python), forecast (R) |
| Deep Learning | TensorFlow/Keras (Python) |
| Visualization | Matplotlib, Seaborn, ggplot2 |
| Version Control | Git/GitHub |
| Documentation | R Markdown, Jupyter Notebooks |

---

## 🛠️ Technical Skills & Technologies

### Programming Languages
- **Python** - Primary analysis, machine learning, visualization
- **R** - Statistical modeling, data manipulation, reporting

### Python Libraries
- **TensorFlow/Keras** - LSTM model development & training
- **statsmodels** - ARIMA implementation & diagnostics
- **scikit-learn** - Data preprocessing & evaluation metrics
- **pandas** - Data manipulation & exploration
- **NumPy** - Numerical computations
- **Matplotlib/Seaborn** - Data visualization

### R Packages
- **forecast** - ARIMA modeling & time series analysis
- **tidyverse** - Data wrangling & ggplot2 visualization
- **lubridate** - Temporal data handling
- **ggplot2** - Advanced graphics

### Time Series Methods
- **ARIMA Modeling** - Stationarity testing (ADF, KPSS), ACF/PACF analysis, parameter optimization
- **LSTM Networks** - Sequence modeling, dropout regularization, temporal pattern learning
- **Model Evaluation** - MAE, RMSE, MAPE metrics, Diebold-Mariano testing
- **Feature Engineering** - Lag features, rolling windows, normalization

### Statistical Techniques
- Stationarity testing & differencing
- Autocorrelation analysis
- Residual diagnostics
- Cross-validation strategies
- Performance benchmarking

### Data Science Concepts
- Time series decomposition
- Sequence-to-sequence modeling
- Hyperparameter tuning
- Model comparison & validation
- Statistical hypothesis testing

---

## 📋 Project Timeline

- **Phase 1:** Literature review and data collection
- **Phase 2:** Data exploration and preprocessing
- **Phase 3:** ARIMA model development and validation
- **Phase 4:** LSTM model development and training
- **Phase 5:** Comparative analysis and evaluation
- **Phase 6:** Report writing and presentation preparation

---

## 📧 Contact & Support

For questions about this project, please refer to:
- **Final Report:** [04_Reports/Final_Reports/](04_Reports/Final_Reports/)
- **Proposals:** [04_Reports/Proposals/](04_Reports/Proposals/)
- **Documentation:** [03_Documentation/](03_Documentation/)

---

## 📂 Archive

Legacy files from earlier project versions have been preserved in the [.archive/](.archive/) directory for reference.

---

## 📄 License

This project is submitted as coursework for University at Buffalo (MS Program).

---

## ✅ Checklist for Usage

- [ ] Review the [04_Reports/Final_Reports/](04_Reports/Final_Reports/) for complete analysis
- [ ] Check [05_Research_Papers/](05_Research_Papers/) for literature foundation
- [ ] Run [01_Source_Code/Python/PyCode_Stat.ipynb](01_Source_Code/Python/PyCode_Stat.ipynb) for Python results
- [ ] Run [01_Source_Code/R_Code/Team12Code.Rmd](01_Source_Code/R_Code/Team12Code.Rmd) for R results
- [ ] Review [02_Data/Raw/](02_Data/Raw/) for dataset information

---

**Last Updated:** December 2024  
**Project Status:** Complete ✓
