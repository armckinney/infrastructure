{
  "lenses": [
    {
      "order": 0,
      "parts": [
        {
          "position": {
            "x": 0,
            "y": 0,
            "colSpan": 2,
            "rowSpan": 2
          },
          "metadata": {
            "inputs": [],
            "type": "Extension/HubsExtension/PartType/ClockPart",
            "settings": {
              "content": {
                "timezoneId": "Central Standard Time",
                "timeFormat": "h:mma",
                "version": 1
              }
            }
          }
        },
        {
          "position": {
            "x": 2,
            "y": 0,
            "colSpan": 4,
            "rowSpan": 2
          },
          "metadata": {
            "inputs": [
              {
                "name": "budgetId",
                "value": "providers/Microsoft.Billing/billingAccounts/${billing_account_id}/providers/Microsoft.Consumption/budgets/budget-monthly"
              }
            ],
            "type": "Extension/Microsoft_Azure_CostManagement/PartType/CurrentSpendvsBudgetPart"
          }
        },
        {
          "position": {
            "x": 6,
            "y": 0,
            "colSpan": 2,
            "rowSpan": 2
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceId",
                "isOptional": true
              },
              {
                "name": "subscriptions",
                "value": [],
                "isOptional": true
              },
              {
                "name": "resourceGroupsNames",
                "value": [],
                "isOptional": true
              },
              {
                "name": "resourceNames",
                "value": [],
                "isOptional": true
              },
              {
                "name": "resourceTypes",
                "value": [],
                "isOptional": true
              },
              {
                "name": "severity",
                "value": [],
                "isOptional": true
              },
              {
                "name": "alertCondition",
                "value": [
                  "Fired"
                ],
                "isOptional": true
              },
              {
                "name": "userResponses",
                "value": [],
                "isOptional": true
              },
              {
                "name": "monitorServices",
                "value": [],
                "isOptional": true
              },
              {
                "name": "timeRange",
                "value": {
                  "timeRangeOptions": "1d",
                  "customDateTimeRange": null
                },
                "isOptional": true
              },
              {
                "name": "queryContains",
                "isOptional": true
              },
              {
                "name": "queryInputs",
                "isOptional": true
              },
              {
                "name": "managementGroups",
                "isOptional": true
              },
              {
                "name": "searchValue",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_Azure_Monitoring_Alerts/PartType/AlertsSummaryBladePinnedPart",
            "deepLink": "#view/Microsoft_Azure_Monitoring/AzureMonitoringBrowseBlade/~/alertsV2"
          }
        },
        {
          "position": {
            "x": 8,
            "y": 0,
            "colSpan": 2,
            "rowSpan": 2
          },
          "metadata": {
            "inputs": [
              {
                "name": "id",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_Azure_Storage/PartType/StorageBrowserPart"
          }
        },
        {
          "position": {
            "x": 10,
            "y": 0,
            "colSpan": 2,
            "rowSpan": 2
          },
          "metadata": {
            "inputs": [],
            "type": "Extension/HubsExtension/PartType/ArmExplorerStartPart"
          }
        },
        {
          "position": {
            "x": 0,
            "y": 2,
            "colSpan": 6,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "scope",
                "value": "/providers/Microsoft.Billing/billingAccounts/${billing_account_id}"
              },
              {
                "name": "scopeName",
                "value": "${billing_scope_name}"
              },
              {
                "name": "view",
                "value": {
                  "currency": "USD",
                  "dateRange": "ThisMonth",
                  "query": {
                    "type": "ActualCost",
                    "dataSet": {
                      "granularity": "Daily",
                      "aggregation": {
                        "totalCost": {
                          "name": "Cost",
                          "function": "Sum"
                        },
                        "totalCostUSD": {
                          "name": "CostUSD",
                          "function": "Sum"
                        }
                      },
                      "sorting": [
                        {
                          "direction": "ascending",
                          "name": "UsageDate"
                        }
                      ],
                      "grouping": [
                        {
                          "type": "Dimension",
                          "name": "ServiceName"
                        }
                      ]
                    },
                    "timeframe": "None"
                  },
                  "chart": "Area",
                  "accumulated": "true",
                  "pivots": [
                    {
                      "type": "Dimension",
                      "name": "ResourceGroupName"
                    },
                    {
                      "type": "Dimension",
                      "name": "ServiceName"
                    },
                    {
                      "type": "Dimension",
                      "name": "ResourceId"
                    }
                  ],
                  "scope": "providers/Microsoft.Billing/billingAccounts/${billing_account_id}",
                  "kpis": [
                    {
                      "type": "Budget",
                      "id": "/providers/Microsoft.Billing/billingAccounts/${billing_account_id}/providers/Microsoft.Consumption/budgets/budget-monthly-account",
                      "enabled": true,
                      "extendedProperties": {
                        "name": "budget-monthly-account",
                        "amount": 15,
                        "timeGrain": "Monthly",
                        "type": "Microsoft.Billing"
                      }
                    },
                    {
                      "type": "Forecast",
                      "enabled": true
                    }
                  ],
                  "displayName": "costview-accumulated_by_resource-account"
                },
                "isOptional": true
              },
              {
                "name": "externalState",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_Azure_CostManagement/PartType/CostAnalysisPinPart",
            "deepLink": "#view/Microsoft_Azure_GTM/ModernBillingMenuBlade/~/costManagementMenuItem"
          }
        },
        {
          "position": {
            "x": 6,
            "y": 2,
            "colSpan": 6,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [],
            "type": "Extension/HubsExtension/PartType/MarkdownPart",
            "settings": {
              "content": {
                "content": "**Static Web Apps**\n- [Portfolio](http://armckinney.dev)\n- [Geohops](http://geohops.armckinney.dev)\n- [Epicentered](http://epicentered.armckinney.dev)\n\n**Container Apps**\n- [Mail To Me](http://mailtome.armckinney.dev)\n- [West End Financial](http://westendfinancial.armckinney.dev)\n\n",
                "title": "Quick Links",
                "subtitle": "To the future",
                "markdownSource": 1,
                "markdownUri": ""
              }
            }
          }
        },
        {
          "position": {
            "x": 0,
            "y": 6,
            "colSpan": 6,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "scope",
                "value": "/providers/Microsoft.Billing/billingAccounts/${billing_account_id}"
              },
              {
                "name": "scopeName",
                "value": "${billing_scope_name}"
              },
              {
                "name": "view",
                "value": {
                  "currency": "USD",
                  "dateRange": "ThisMonth",
                  "query": {
                    "type": "ActualCost",
                    "dataSet": {
                      "granularity": "Daily",
                      "aggregation": {
                        "totalCost": {
                          "name": "Cost",
                          "function": "Sum"
                        },
                        "totalCostUSD": {
                          "name": "CostUSD",
                          "function": "Sum"
                        }
                      },
                      "sorting": [
                        {
                          "direction": "ascending",
                          "name": "UsageDate"
                        }
                      ],
                      "grouping": [
                        {
                          "type": "Dimension",
                          "name": "ServiceName"
                        }
                      ]
                    },
                    "timeframe": "None"
                  },
                  "chart": "Area",
                  "accumulated": "false",
                  "pivots": [
                    {
                      "type": "Dimension",
                      "name": "ResourceGroupName"
                    },
                    {
                      "type": "Dimension",
                      "name": "ServiceName"
                    },
                    {
                      "type": "Dimension",
                      "name": "ResourceId"
                    }
                  ],
                  "scope": "providers/Microsoft.Billing/billingAccounts/${billing_account_id}",
                  "kpis": [
                    {
                      "type": "Budget",
                      "id": "/providers/Microsoft.Billing/billingAccounts/${billing_account_id}/providers/Microsoft.Consumption/budgets/budget-monthly-account",
                      "enabled": true,
                      "extendedProperties": {
                        "name": "budget-monthly-account",
                        "amount": 15,
                        "timeGrain": "Monthly",
                        "type": "Microsoft.Billing"
                      }
                    },
                    {
                      "type": "Forecast",
                      "enabled": true
                    }
                  ],
                  "displayName": "costview-daily_by_resource-account"
                },
                "isOptional": true
              },
              {
                "name": "externalState",
                "isOptional": true
              }
            ],
            "type": "Extension/Microsoft_Azure_CostManagement/PartType/CostAnalysisPinPart",
            "deepLink": "#view/Microsoft_Azure_GTM/ModernBillingMenuBlade/~/costManagementMenuItem"
          }
        },
        {
          "position": {
            "x": 6,
            "y": 6,
            "colSpan": 6,
            "rowSpan": 4
          },
          "metadata": {
            "inputs": [
              {
                "name": "resourceType",
                "value": "Microsoft.Resources/recent",
                "isOptional": true
              },
              {
                "name": "filter",
                "isOptional": true
              },
              {
                "name": "scope",
                "isOptional": true
              },
              {
                "name": "kind",
                "isOptional": true
              }
            ],
            "type": "Extension/HubsExtension/PartType/BrowseRecentResourcesPinnedPart"
          }
        },
        {
          "position": {
            "x": 0,
            "y": 10,
            "colSpan": 8,
            "rowSpan": 5
          },
          "metadata": {
            "inputs": [
              {
                "name": "filter",
                "isOptional": true
              },
              {
                "name": "view",
                "value": {
                  "id": "2f6d20a5-0e72-4198-9bd9-2fbbc3712040",
                  "name": "2f6d20a5-0e72-4198-9bd9-2fbbc3712040",
                  "filterFacets": [
                    {
                      "key": "locationDisplayName",
                      "uniqueId": "2f6d20a5-0e72-4198-9bd9-2fbbc371203b",
                      "display": "Location",
                      "operator": 1,
                      "isAllValues": true,
                      "facetKind": 1
                    }
                  ],
                  "groupByValue": "",
                  "sortedColumns": [
                    {
                      "sortBy": "name",
                      "order": 1,
                      "castFunction": 2
                    }
                  ],
                  "showAll": false,
                  "gridColumns": [
                    {
                      "id": "subscription",
                      "name": "Subscription",
                      "visible": true,
                      "index": 0
                    },
                    {
                      "id": "location",
                      "name": "Location",
                      "description": "The supported Azure location where the resource exists.",
                      "visible": true,
                      "index": 1
                    }
                  ],
                  "gridColumnWidths": {
                    "subscription": "100fr",
                    "location": "100fr"
                  },
                  "currentView": 1,
                  "visualizationId": "location",
                  "visualizationType": 4,
                  "visualizationThreshold": 1
                },
                "isOptional": true
              }
            ],
            "type": "Extension/HubsExtension/PartType/BrowseResourceGroupsTile"
          }
        },
        {
          "position": {
            "x": 8,
            "y": 10,
            "colSpan": 4,
            "rowSpan": 5
          },
          "metadata": {
            "inputs": [
              {
                "name": "subscriptionId",
                "isOptional": true
              }
            ],
            "type": "Extension/HubsExtension/PartType/TagsTile"
          }
        }
      ]
    }
  ],
  "metadata": {
    "model": {
      "timeRange": {
        "value": {
          "relative": {
            "duration": 24,
            "timeUnit": 1
          }
        },
        "type": "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
      },
      "filterLocale": {
        "value": "en-us"
      },
      "filters": {
        "value": {
          "MsPortalFx_TimeRange": {
            "model": {
              "format": "utc",
              "granularity": "auto",
              "relative": "24h"
            },
            "displayCache": {
              "name": "UTC Time",
              "value": "Past 24 hours"
            },
            "filteredPartIds": []
          }
        }
      }
    }
  }
}
