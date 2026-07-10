import pandas as pd
import numpy as np

# 读取数据
df = pd.read_excel('Study_Habits_data.xlsx')

# 分组计算
table1 = df.groupby('Primary_Study_Method')['Final_Course_Percentage'].agg([
    ('n', 'count'),
    ('Mean', 'mean'),
    ('SD', 'std')
]).round(1)
print(table1)