library("tableone")
library("MatchIt")
library("survival")
library("survminer")
library("autoReg")
library("rrtable")
library("foreign")
library("tidycmprsk")

dat <- X031323310201month

str(X031323310201month)

vars <- c("Age", "Sex", "Site", "Radiation", "Chemotherapy", "Bone", "Brain", "Liver", "Lung")

dat[vars] <- lapply(dat[vars], factor)

str(dat)

myVars <- c("Age")
catVars <- c("Age","Sex","Site","Chemotherapy","Bone","Brain","Liver","Lung")

plot(summary(m_out))

tab2 <- CreateTableOne(vars = myVars, data = psm_matchit_data, factorVars = catVars, strata = "Radiation")
print(tab2)

m_out <- matchit(
  formula1,
  data = dat,
  method = "nearest",
  distance = "logit",
  m.order = "random",
  ratio = 1,
  caliper = 0.2,
  replace = FALSE
)

psm_matchit_data <- match.data(m_out)

summary(m_out)

plot(summary(m_out))

matched_data <- match.data(m_out)

logit_model <- glm(
  Radiation ~ Age+Sex+Site+Chemotherapy+Bone+Brain+Liver+Lung,
  data = psm_matchit_data,
  family = binomial
)

psm_matchit_data$propensity_score <- predict(logit_model, type = "response")

median_score <- median(psm_matchit_data$propensity_score)
matched_data$strata <- ifelse(psm_matchit_data$propensity_score < median_score, "Low", "High")

install.packages("dplyr")
library(dplyr)

analysis_results <- matched_data %>%
  group_by(strata, Radiation) %>%
  summarise(mean_outcome = mean(months)) %>%
  pivot_wider(names_from = Radiation, values_from = mean_outcome, names_prefix = "mean_outcome_")

print(analysis_results)

box_plot <- ggplot(matched_data, aes(x = factor(strata), y = months, fill = factor(Liver))) +
  geom_boxplot(color = "black", alpha = 0.8, outlier.color = "red") +
  labs(x = "Strata", y = "months", fill = "Liver") +
  scale_fill_manual(values = c("#FF6B6B", "#4D8AC8"), labels = c("Low", "High")) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title = element_text(size = 20, face = "bold"),
    axis.text = element_text(size = 20, color = "black"),
    legend.title = element_text(size = 18, face = "bold"),
    legend.text = element_text(size = 18),
    legend.position = "right",
    legend.key.size = unit(1, "cm")
  )
print(box_plot)

box_plot <- ggplot(matched_data, aes(x = factor(strata), y = months, fill = factor(Chemotherapy))) +
  geom_boxplot(
    color = "black",
    alpha = 0.8,
    outlier.color = "red"
  ) +
  labs(
    x = "Strata",
    y = "months",
    fill = "Chemotherapy"
  ) +
  scale_fill_manual(
    values = c("#FF6B6B", "#4D8AC8"),
    labels = c("Low", "High")
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title.x = element_text(size = 20, face = "bold"),
    axis.title.y = element_text(size = 20, face = "bold"),
    axis.text.x = element_text(size = 20, color = "black"),
    axis.text.y = element_text(size = 20, color = "black"),
    legend.title = element_text(size = 15, face = "bold"),
    legend.text = element_text(size = 18),
    legend.position = "right",
    legend.key.size = unit(1, "cm")
  )

print(box_plot)

box_plot <- ggplot(matched_data, aes(x = factor(strata), y = months, fill = factor(Bone))) +
  geom_boxplot(
    color = "black",
    alpha = 0.8,
    outlier.color = "red"
  ) +
  labs(
    x = "Strata",
    y = "months",
    fill = "Bone"
  ) +
  scale_fill_manual(
    values = c("#FF6B6B", "#4D8AC8"),
    labels = c("Low", "High")
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title.x = element_text(size = 20, face = "bold"),
    axis.title.y = element_text(size = 20, face = "bold"),
    axis.text.x = element_text(size = 20, color = "black"),
    axis.text.y = element_text(size = 20, color = "black"),
    legend.title = element_text(size = 18, face = "bold"),
    legend.text = element_text(size = 18),
    legend.position = "right",
    legend.key.size = unit(1, "cm")
  )

print(box_plot)

box_plot <- ggplot(matched_data, aes(x = factor(strata), y = months, fill = factor(Brain))) +
  geom_boxplot(
    color = "black",
    alpha = 0.8,
    outlier.color = "red"
  ) +
  labs(
    x = "Strata",
    y = "months",
    fill = "Brain"
  ) +
  scale_fill_manual(
    values = c("#FF6B6B", "#4D8AC8"),
    labels = c("Low", "High")
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title.x = element_text(size = 20, face = "bold"),
    axis.title.y = element_text(size = 20, face = "bold"),
    axis.text.x = element_text(size = 20, color = "black"),
    axis.text.y = element_text(size = 20, color = "black"),
    legend.title = element_text(size = 18, face = "bold"),
    legend.text = element_text(size = 18),
    legend.position = "right",
    legend.key.size = unit(1, "cm")
  )

print(box_plot)

box_plot <- ggplot(matched_data, aes(x = factor(strata), y = months, fill = factor(Lung))) +
  geom_boxplot(
    color = "black",
    alpha = 0.8,
    outlier.color = "red"
  ) +
  labs(
    x = "Strata",
    y = "months",
    fill = "Lung"
  ) +
  scale_fill_manual(
    values = c("#FF6B6B", "#4D8AC8"),
    labels = c("Low", "High")
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title.x = element_text(size = 20, face = "bold"),
    axis.title.y = element_text(size = 20, face = "bold"),
    axis.text.x = element_text(size = 20, color = "black"),
    axis.text.y = element_text(size = 20, color = "black"),
    legend.title = element_text(size = 18, face = "bold"),
    legend.text = element_text(size = 18),
    legend.position = "right",
    legend.key.size = unit(1, "cm")
  )

print(box_plot)

box_plot <- ggplot(matched_data, aes(x = factor(strata), y = months, fill = factor(Sex))) +
  geom_boxplot(
    color = "black",
    alpha = 0.8,
    outlier.color = "red"
  ) +
  labs(
    x = "Strata",
    y = "months",
    fill = "Sex"
  ) +
  scale_fill_manual(
    values = c("#FF6B6B", "#4D8AC8"),
    labels = c("Low", "High")
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title.x = element_text(size = 20, face = "bold"),
    axis.title.y = element_text(size = 20, face = "bold"),
    axis.text.x = element_text(size = 20, color = "black"),
    axis.text.y = element_text(size = 20, color = "black"),
    legend.title = element_text(size = 18, face = "bold"),
    legend.text = element_text(size = 18),
    legend.position = "right",
    legend.key.size = unit(1, "cm")
  )

print(box_plot)

box_plot <- ggplot(matched_data, aes(x = factor(strata), y = months, fill = factor(Age))) +
  geom_boxplot(
    color = "black",
    alpha = 0.8,
    outlier.color = "red"
  ) +
  labs(
    x = "Strata",
    y = "months",
    fill = "Age"
  ) +
  scale_fill_manual(
    values = c("#FF6B6B", "#4D8AC8", "#FFD700", "#32CD32", "#8A2BE2"),
    labels = c("<30", "30-40", "40-50", "50-60", ">60")
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title.x = element_text(size = 20, face = "bold"),
    axis.title.y = element_text(size = 20, face = "bold"),
    axis.text.x = element_text(size = 20, color = "black"),
    axis.text.y = element_text(size = 20, color = "black"),
    legend.title = element_text(size = 18, face = "bold"),
    legend.text = element_text(size = 18),
    legend.position = "right",
    legend.key.size = unit(1, "cm")
  )

print(box_plot)

box_plot <- ggplot(matched_data, aes(x = factor(strata), y = months, fill = factor(Site))) +
  geom_boxplot(
    color = "black",
    alpha = 0.8,
    outlier.color = "red"
  ) +
  labs(
    x = "Strata",
    y = "months",
    fill = "Site"
  ) +
  scale_fill_manual(
    values = c("#FF6B6B", "#4D8AC8", "#FFD700", "#32CD32", "#8A2BE2", "#FF8C00"),
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 20, face = "bold"),
    axis.title.x = element_text(size = 20, face = "bold"),
    axis.title.y = element_text(size = 20, face = "bold"),
    axis.text.x = element_text(size = 20, color = "black"),
    axis.text.y = element_text(size = 20, color = "black"),
    legend.title = element_text(size = 18, face = "bold"),
    legend.text = element_text(size = 18),
    legend.position = "right",
    legend.key.size = unit(1, "cm")
  )

print(box_plot)

summary(coxph(Surv(months,status) ~ Radiation, data = psm_matchit_data))

fit_psm <- survfit(Surv(months,status) ~ Radiation, data = psm_matchit_data)

ggsurvplot(
  fit_psm,
  data = psm_matchit_data,
  conf.int = TRUE,
  pval.coord = c(1, 0.5),
  pval = "Log rank test P<0.001\nHR (95%CI): 1.328 (1.296 - 1.362)",
  risk.table = FALSE,
  legend.labs = c("None/Unknown", "Yes"),
  legend.title = "Radiation",
  linetype = c('solid', 'solid'),
  ylim = c(0, 1),
  xlim = c(0, 72),
  break.x.by = 12,
  risk.table.height = 0.25,
  xscale = 1,
  fontsize = 6,
  font.tickslab = 20,
  font.legend = c(20, "bold", "black"),
  ggtheme = theme_survminer() + theme(
    axis.title = element_text(size = 20),
    legend.title = element_text(size = 20, face = "bold")
  ),
  palette = c("#E41A1C", "#377EB8")
)

fit <- coxph(Surv(months, status) ~ Age + Sex + Site + Radiation + Bone + Brain + Liver + Lung, data = psm_matchit_data)

fit2 <- autoReg(fit, uni = TRUE, threshold = 0.05, final = FALSE)
myft(fit2)

fit3 <- coxph(Surv(months, status) ~ Chemotherapy + strata(subclass) + Race + Age + Sex + Site + size + TStage + Nstage + Mstage + Chemotherapy + Bone + Brain + Liver + Lung, data = psm_matchit_data)
summary(fit3)

fit3 <- coxph(Surv(months, status) ~ Radiation + strata(subclass) + Age + Sex + Site + Chemotherapy + Bone + Brain + Liver + Lung, data = psm_matchit_data)
summary(fit3)

matched_data$strata 