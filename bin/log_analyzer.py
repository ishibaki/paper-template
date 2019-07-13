#!/usr/bin/env python3

import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
from matplotlib import rcParams

df_log = pd.read_csv('./log/writing_log.csv')

log_2 = np.array(df_log.iloc[1:, :].loc[:, ['word', 'letter']])
log_1 = np.array(df_log.iloc[:-1, :].loc[:, ['word', 'letter']])

delta = pd.DataFrame(log_2 - log_1, columns=['Writing amount', 'letter'])
date_for_delta = np.array(df_log['date'][1:], ndmin=2).T
date_for_delta = pd.DataFrame(date_for_delta, columns=['date'])
delta = pd.concat([date_for_delta, delta], axis=1)

delta_by_day = delta.groupby('date')
word_count = pd.DataFrame(delta_by_day.sum()['Writing amount'])

# Set parameters
rcParams['figure.figsize'] = (9, 0.6*word_count.shape[0])

# Generate Figure & Axes instances
fig = plt.figure()
fig.subplots_adjust(left=0.2)
fig.subplots_adjust(bottom=0.2)
ax = fig.add_subplot(1, 1, 1)

# Bar plot
ax = sns.barplot(data=word_count, x='Writing amount', y=word_count.index,
                 orient='h', ci=None, color='white',
                 edgecolor='k')

# X-axis Settings
# ax.set_ylabel('date')
# ax.set_yticks(x)
# ax.set_yticklabels(word_count.index[::-1])

# Y-axis Settings
# ax.set_xlabel('words')

plt.savefig('./log/log.pdf', format='pdf', bbox_inches='tight')
# plt.show()
