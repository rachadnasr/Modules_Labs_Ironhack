import streamlit as st 
import pandas as pd
import numpy as np
from sklearn import datasets
import seaborn as sns
import matplotlib.pyplot as plt

# upload breast cancer dataset from pandas library

breast_cancer = datasets.load_breast_cancer(as_frame=True)
breast_cancer_df = pd.concat((breast_cancer["data"], breast_cancer["target"]), axis=1)
breast_cancer_df["target"] = [breast_cancer.target_names[val] for val in breast_cancer_df["target"]]

breast_cancer_df.head()


# Set page layout as wide
st.set_page_config(layout="wide")

# Name dashboard Breast Cancer Stats (use st.markdown)
st.markdown("# Breast Cancer Stats")

# Scatter Plot

options = list(breast_cancer_df.columns)

st.markdown("## Scatter Plot")

x_axis = st.sidebar.selectbox('Select X-axis measurement', options)
y_axis = st.sidebar.selectbox('Select Y-axis measurement', options)

if x_axis and y_axis:
    sns.scatterplot(data=breast_cancer_df, x=x_axis, y=y_axis, hue = "target")
    st.set_option('deprecation.showPyplotGlobalUse', False) #this added in order to not have a warning message
    
    st.pyplot()
    
# Side by Side Bar Chart

st.markdown("## Side by Side Bar Chart")

avg_breast_cancer_df = breast_cancer_df.groupby("target").mean()
avg_breast_cancer_df

measurement_names = avg_breast_cancer_df.columns[:-1]
default_values = ["mean radius", "mean texture", "mean perimeter", "area error"]
selected_measurements = st.multiselect("Select measurements", measurement_names, default=default_values)

fig, ax = plt.subplots()
sns.barplot(avg_breast_cancer_df, ax=ax)
ax.set_title("Average measurements")
ax.set_xlabel("Measurement")
ax.set_ylabel("Average value")

st.pyplot(fig)






# Define list of measurements and default values for multi-select
measurements = ["mean radius", "mean texture", "mean perimeter", "area error"]
default_values = ["mean radius", "mean texture", "mean perimeter", "area error"]

# Add markdown for multi-select in sidebar
st.sidebar.markdown("## Select measurements to display:")
selected_measurements = st.sidebar.multiselect("", measurements, default=default_values)

# If any options are selected, create bar chart with selected options
if selected_measurements:
    chart_data = df_mean[selected_measurements].reset_index()
    chart_data = pd.melt(chart_data, id_vars=["diagnosis"], var_name="measurement", value_name="value")
    chart = alt.Chart(chart_data).mark_bar().encode(
        x="diagnosis",
        y="value",
        color="measurement"
    )
    st.altair_chart(chart, use_container_width=True)
    
# If no options are selected, create bar chart with default values
else:
    chart_data = df_mean[default_values].reset_index()
    chart_data = pd.melt(chart_data, id_vars=["diagnosis"], var_name="measurement", value_name="value")
    chart = alt.Chart(chart_data).mark_bar().encode(
        x="diagnosis",
        y="value",
        color="measurement"
    )
    st.altair_chart(chart, use_container_width=True)