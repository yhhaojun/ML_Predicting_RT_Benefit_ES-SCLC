## Abstract

**Introduction:** An accurate machine learning–based prognostic model for the diagnosis and treatment of extensive-stage small cell lung cancer (ES-SCLC) is currently lacking, and the role of radiotherapy in ES-SCLC remains a subject of ongoing debate.

**Methods:** This study utilized data from the Surveillance, Epidemiology, and End Results (SEER) database on patients diagnosed with ES-SCLC. Cox regression analysis was performed to identify key prognostic factors. Six machine learning models—XGBoost, Support Vector Machine (SVM), K-Nearest Neighbor (KNN), Random Forest, Iterative Dichotomiser 3 (ID3), and Logistic Regression (LR)—were developed. External validation was conducted using medical records of ES-SCLC patients who met the screening criteria at a local hospital. To address baseline imbalances, propensity score matching (PSM) was applied. Kaplan–Meier (K-M) survival analysis was used to evaluate the prognostic impact of radiotherapy, followed by stratified K-M analysis to further explore its applicability across subgroups.

**Results:** The analysis revealed that radiotherapy, chemotherapy, and liver metastasis were significantly associated with prognosis (p < 0.001). Liver metastasis was identified as an independent risk factor for poor survival. The XGBoost model performed best in predicting 1-, 2-, and 3-year survival (test set AUC = 0.79, 0.79, 0.71, respectively) and showed good performance in external validation. Stratified K-M analysis suggested that radiotherapy may benefit certain patient subgroups, particularly those without liver, brain, or bone metastases, females, patients aged 50-69 years, or those with primary tumors located in the middle lobe or main airways.

**Conclusion:** This study provides novel insights into radiotherapy indications for ES-SCLC, contributing to improved clinical guidelines and treatment strategies based on machine learning–derived prognostic models. We strongly recommend radiotherapy for patients meeting specific criteria.

**Keywords:** Machine learning, Small cell lung cancer, XGBoost, Prognosis, Radiotherapy

## Project Background

Small cell lung cancer (SCLC) is a highly aggressive neuroendocrine tumor with a poor prognosis, especially in the extensive stage (ES-SCLC). Accurate prediction of patient prognosis and determination of optimal treatment strategies (particularly the role of radiotherapy) are crucial for improving patient survival. Traditional prognostic models (like nomograms) have limitations, while machine learning has the potential to provide more accurate predictions. This project aims to utilize machine learning methods, combining data from the SEER database and a local hospital cohort, to build a prognostic model for ES-SCLC patients and thoroughly investigate the applicability of radiotherapy in different patient subgroups.

## Methods Overview

1.  **Data Sources:**
    *   Primary Data: SEER database (2010-2015), including 2950 ES-SCLC patients.
    *   External Validation Data: Local hospital (2018-2023), including 34 ES-SCLC patients.
2.  **Statistical Analysis:**
    *   Used univariate and multivariate Cox regression analysis to identify independent prognostic factors affecting overall survival (OS).
    *   Applied Propensity Score Matching (PSM) to balance baseline characteristics between patients receiving radiotherapy and those who did not.
    *   Used Kaplan-Meier (K-M) survival analysis and stratified analysis to evaluate the impact of radiotherapy on prognosis in different subgroups.
3.  **Machine Learning Models:**
    *   Built six models: XGBoost, RandomForest, KNN, ID3, SVM, LR.
    *   Optimized hyperparameters using grid search and 5-fold cross-validation.
    *   Evaluated model performance using ROC curves and AUC values.
    *   Analyzed feature importance in the XGBoost model.
4.  **Software Tools:**
    *   Machine Learning Model Building: Python (3.11.5), XGBoost (2.0.3), scikit-learn (1.3.0).
    *   Statistical Analysis: R (4.3.0).

## Main Results

*   **Independent Prognostic Factors:** Sex, radiotherapy, chemotherapy, and liver metastasis were identified as independent factors affecting the OS of ES-SCLC patients.
*   **Model Performance:** The XGBoost model demonstrated the best performance in predicting 1-, 2-, and 3-year OS and was validated on the external dataset.
*   **Feature Importance:**
    *   1-year survival prediction: Chemotherapy, radiotherapy, liver metastasis, age, and brain metastasis were most important.
    *   2- and 3-year survival prediction: Liver metastasis, chemotherapy, age, sex, and radiotherapy were most important.
*   **Radiotherapy Benefit Subgroups:** Stratified analysis after PSM adjustment showed that radiotherapy significantly improved survival for the overall ES-SCLC patient cohort. The following subgroups may benefit more from radiotherapy:
    *   Patients receiving chemotherapy
    *   Patients without liver, brain, or bone metastases
    *   Female patients
    *   Patients aged 50-69 years
    *   Patients with primary tumors located in the middle lobe or main airways (excluding lung metastasis)

## Discussion & Limitations

This study developed the first AI-based prognostic model for ES-SCLC and provided evidence for the application of radiotherapy in specific subgroups. The findings suggest updating clinical guidelines and considering the development of model-based decision support tools.

**Limitations:**
*   Inability to include immunotherapy data.
*   Lack of detailed treatment information in the SEER database.
*   Inherent biases in retrospective studies.
*   The study population was predominantly White individuals from the U.S., potentially limiting the generalizability of the findings.

## File Structure

*   `README.md`: This documentation file.
*   `analysis.r`: R script for statistical analysis (e.g., Cox regression, PSM, K-M analysis).
*   `0313-12m.ipynb`: Jupyter Notebook file containing Python code for building and evaluating the 1-year survival prediction machine learning model.
*   `0313-24m.ipynb`: Jupyter Notebook file containing Python code for building and evaluating the 2-year survival prediction machine learning model.
*   `0313-36m.ipynb`: Jupyter Notebook file containing Python code for building and evaluating the 3-year survival prediction machine learning model.

