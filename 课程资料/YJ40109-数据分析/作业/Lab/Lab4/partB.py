import pandas as pd
df = pd.read_excel('Study_Habits_data.xlsx')


contingency_table = pd.crosstab(
    df['Primary_Study_Method'],
    df['Grade_Category']
)
print("Table 2: 列联表")
print(contingency_table)

# 保存为表格格式
contingency_table.to_clipboard()