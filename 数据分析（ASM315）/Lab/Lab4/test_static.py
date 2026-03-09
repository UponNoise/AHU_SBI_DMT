from scipy import stats
import statsmodels.api as sm
from statsmodels.stats.multicomp import pairwise_tukeyhsd
import pandas as pd

df = pd.read_excel('Study_Habits_data.xlsx')

# 提取各组数据
cram = df[df['Primary_Study_Method']=='Cramming']['Final_Course_Percentage']
space = df[df['Primary_Study_Method']=='Spaced_Repetition']['Final_Course_Percentage']
pract = df[df['Primary_Study_Method']=='Practice_Testing']['Final_Course_Percentage']

# 方差齐性检验（Levene检验）
levene_stat, levene_p = stats.levene(cram, space, pract)
print(f"Levene检验: p={levene_p:.4f}")

# 单因素ANOVA
f_stat, p_value = stats.f_oneway(cram, space, pract)
print(f"ANOVA结果: F={f_stat:.2f}, p={p_value:.4f}")