# Changelog

## usage-monitor-plugin-deepseek 2.1.0 (2026-09-05)

- 移除 meta.iconUrl / meta.iconUrlDark，logo 改为运行时从网页 favicon 抓取（宿主按主题选择可渲染资源）。

## usage-monitor-plugin-deepseek 2.0.0 (2026-09-05)

- `supportedTables` 扩展为 `[1]`（保留单表）；数据源 URL 双语化。
- 卡片单位统一为 `unit: ¥`；tooltip 字段调整（balance_amount / monthly_cost）。
- 下线 X-8 subscription_active 相关 computed 段。

## usage-monitor-plugin-deepseek 1.0.0 (2026-09-02)

Initial release as an independent plugin repository.

迁移自主项目 `src/Plugins/UsageMonitor.Provider.`（如适用）。
