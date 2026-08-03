a!headerContentLayout(
  header: {
    a!billboardLayout(
      backgroundColor: "#dbf1d3",
      height: if(
        a!isPageWidth({ "PHONE" }),
        "MEDIUM",
        "SHORT_PLUS"
      ),
      marginBelow: "NONE",
      overlay: a!fullOverlay(
        alignVertical: if(
          a!isPageWidth({ "PHONE" }),
          "TOP",
          "MIDDLE"
        ),
        contents: {
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: {
              a!richTextItem(
                text: {
                  "Journey to ",
                  a!richTextItem(
                    text: { "Net-Zero Carbon " },
                    style: { "STRONG" }
                  )
                },
                color: "#274e13",
                size: if(
                  a!isPageWidth({ "PHONE" }),
                  "MEDIUM",
                  "MEDIUM_PLUS"
                )
              ),
              a!richTextItem(
                text: { "2025" },
                color: "#47b311",
                size: if(
                  a!isPageWidth({ "PHONE" }),
                  "MEDIUM",
                  "MEDIUM_PLUS"
                ),
                style: { "STRONG" }
              ),
              char(10)
            },
            align: if(
              a!isPageWidth({ "PHONE" }),
              "CENTER",
              "LEFT"
            ),
            marginBelow: if(
              a!isPageWidth({ "PHONE" }),
              "STANDARD",
              "NONE"
            )
          ),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: {
              a!richTextItem(
                text: { "2021 ACTUAL IMPACT" },
                size: "SMALL",
                style: { "STRONG" }
              )
            },
            showWhen: a!isPageWidth({ "PHONE" }),
            align: "CENTER",
            marginBelow: "NONE"
          ),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: {
              a!richTextItem(
                text: {
                  a!richTextItem(
                    text: { "______________________________" },
                    size: "SMALL"
                  ),
                  "____________________________________"
                },
                color: "#93c47d"
              )
            },
            showWhen: a!isPageWidth(
              {
                "DESKTOP_NARROW",
                "DESKTOP",
                "DESKTOP_WIDE"
              }
            ),
            marginBelow: "MORE"
          ),
          a!columnsLayout(
            columns: {
              a!columnLayout(
                contents: {
                  a!columnsLayout(
                    columns: {
                      a!columnLayout(
                        contents: {
                          a!sideBySideLayout(
                            items: {
                              a!sideBySideItem(
                                item: a!richTextDisplayField(
                                  label: "2021 ACTUAL IMPACT",
                                  labelPosition: if(
                                    a!isPageWidth({ "PHONE" }),
                                    "COLLAPSED",
                                    "ABOVE"
                                  ),
                                  value: {
                                    a!richTextItem(
                                      text: { a!richTextIcon(icon: "smog") },
                                      color: "#47b311",
                                      size: if(
                                        a!isPageWidth(
                                          {
                                            "DESKTOP_NARROW",
                                            "DESKTOP",
                                            "DESKTOP_WIDE"
                                          }
                                        ),
                                        "LARGE_PLUS",
                                        "MEDIUM_PLUS"
                                      ),
                                      style: { "STRONG" }
                                    ),
                                    a!richTextItem(
                                      text: { " " },
                                      size: if(
                                        a!isPageWidth(
                                          {
                                            "DESKTOP_NARROW",
                                            "DESKTOP",
                                            "DESKTOP_WIDE"
                                          }
                                        ),
                                        "LARGE_PLUS",
                                        "MEDIUM_PLUS"
                                      ),
                                      style: { "STRONG" }
                                    ),
                                    a!richTextItem(
                                      text: {
                                        a!richTextItem(
                                          text: { "314,519 " },
                                          size: if(
                                            a!isPageWidth(
                                              {
                                                "DESKTOP_NARROW",
                                                "DESKTOP",
                                                "DESKTOP_WIDE"
                                              }
                                            ),
                                            "LARGE_PLUS",
                                            "MEDIUM_PLUS"
                                          ),
                                          style: { "STRONG" }
                                        ),
                                        "MTCO2e"
                                      },
                                      color: "#274e13"
                                    ),
                                    a!richTextItem(
                                      text: { " " },
                                      color: "SECONDARY",
                                      size: "LARGE"
                                    )
                                  },
                                  align: if(
                                    a!isPageWidth({ "PHONE" }),
                                    "CENTER",
                                    "LEFT"
                                  ),
                                  marginBelow: if(a!isPageWidth({ "PHONE" }), "LESS", "NONE")
                                ),
                                width: if(
                                  a!isPageWidth({ "PHONE" }),
                                  "AUTO",
                                  "MINIMIZE"
                                )
                              )
                            },
                            alignVertical: "MIDDLE",
                            spacing: "SPARSE"
                          )
                        },
                        width: "AUTO"
                      ),
                      a!columnLayout(
                        contents: {
                          a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: { "2021 OFFSETS" },
                                size: "SMALL",
                                style: { "STRONG" }
                              )
                            },
                            showWhen: a!isPageWidth({ "PHONE" }),
                            align: "CENTER",
                            marginBelow: "NONE"
                          ),
                          a!sideBySideLayout(
                            items: {
                              a!sideBySideItem(
                                item: a!richTextDisplayField(
                                  label: "2021 OFFSETS",
                                  labelPosition: if(
                                    a!isPageWidth({ "PHONE" }),
                                    "COLLAPSED",
                                    "ABOVE"
                                  ),
                                  value: {
                                    a!richTextItem(
                                      text: { a!richTextIcon(icon: "seedling") },
                                      color: "#47b311",
                                      size: if(
                                        a!isPageWidth(
                                          {
                                            "DESKTOP_NARROW",
                                            "DESKTOP",
                                            "DESKTOP_WIDE"
                                          }
                                        ),
                                        "LARGE_PLUS",
                                        "MEDIUM_PLUS"
                                      ),
                                      style: { "STRONG" }
                                    ),
                                    a!richTextItem(
                                      text: { " " },
                                      size: if(
                                        a!isPageWidth(
                                          {
                                            "DESKTOP_NARROW",
                                            "DESKTOP",
                                            "DESKTOP_WIDE"
                                          }
                                        ),
                                        "LARGE_PLUS",
                                        "MEDIUM_PLUS"
                                      ),
                                      style: { "STRONG" }
                                    ),
                                    a!richTextItem(
                                      text: {
                                        a!richTextItem(
                                          text: { "219,482 " },
                                          size: if(
                                            a!isPageWidth(
                                              {
                                                "DESKTOP_NARROW",
                                                "DESKTOP",
                                                "DESKTOP_WIDE"
                                              }
                                            ),
                                            "LARGE_PLUS",
                                            "MEDIUM_PLUS"
                                          ),
                                          style: { "STRONG" }
                                        ),
                                        "MTCO2e"
                                      },
                                      color: "#274e13"
                                    ),
                                    a!richTextItem(
                                      text: { " " },
                                      color: "SECONDARY",
                                      size: "LARGE"
                                    )
                                  },
                                  align: if(
                                    a!isPageWidth({ "PHONE" }),
                                    "CENTER",
                                    "LEFT"
                                  ),
                                  marginBelow: if(a!isPageWidth({ "PHONE" }), "LESS", "NONE")
                                ),
                                width: if(
                                  a!isPageWidth({ "PHONE" }),
                                  "AUTO",
                                  "MINIMIZE"
                                )
                              )
                            },
                            alignVertical: "MIDDLE",
                            spacing: "SPARSE"
                          )
                        },
                        width: "AUTO"
                      ),
                      a!columnLayout(
                        contents: {
                          a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: { "2021 NET IMPACT" },
                                size: "SMALL",
                                style: { "STRONG" }
                              )
                            },
                            showWhen: a!isPageWidth({ "PHONE" }),
                            align: "CENTER",
                            marginBelow: "NONE"
                          ),
                          a!sideBySideLayout(
                            items: {
                              a!sideBySideItem(
                                item: a!richTextDisplayField(
                                  label: "2021 NET IMPACT",
                                  labelPosition: if(
                                    a!isPageWidth({ "PHONE" }),
                                    "COLLAPSED",
                                    "ABOVE"
                                  ),
                                  value: {
                                    a!richTextItem(
                                      text: { a!richTextIcon(icon: "globe-africa") },
                                      color: "#47b311",
                                      size: if(
                                        a!isPageWidth(
                                          {
                                            "DESKTOP_NARROW",
                                            "DESKTOP",
                                            "DESKTOP_WIDE"
                                          }
                                        ),
                                        "LARGE_PLUS",
                                        "MEDIUM_PLUS"
                                      ),
                                      style: { "STRONG" }
                                    ),
                                    a!richTextItem(
                                      text: { " " },
                                      size: if(
                                        a!isPageWidth(
                                          {
                                            "DESKTOP_NARROW",
                                            "DESKTOP",
                                            "DESKTOP_WIDE"
                                          }
                                        ),
                                        "LARGE_PLUS",
                                        "MEDIUM_PLUS"
                                      ),
                                      style: { "STRONG" }
                                    ),
                                    a!richTextItem(
                                      text: {
                                        a!richTextItem(
                                          text: { "95,037 " },
                                          size: if(
                                            a!isPageWidth(
                                              {
                                                "DESKTOP_NARROW",
                                                "DESKTOP",
                                                "DESKTOP_WIDE"
                                              }
                                            ),
                                            "LARGE_PLUS",
                                            "MEDIUM_PLUS"
                                          ),
                                          style: { "STRONG" }
                                        ),
                                        "MTCO2e"
                                      },
                                      color: "#274e13"
                                    ),
                                    a!richTextItem(
                                      text: { " " },
                                      color: "SECONDARY",
                                      size: "LARGE"
                                    )
                                  },
                                  align: if(
                                    a!isPageWidth({ "PHONE" }),
                                    "CENTER",
                                    "LEFT"
                                  ),
                                  marginBelow: "NONE"
                                ),
                                width: if(
                                  a!isPageWidth({ "PHONE" }),
                                  "AUTO",
                                  "MINIMIZE"
                                )
                              )
                            },
                            alignVertical: "MIDDLE",
                            spacing: "SPARSE"
                          )
                        },
                        width: "AUTO"
                      )
                    },
                    marginAbove: "NONE",
                    stackWhen: { "PHONE" },
                    showDividers: if(a!isPageWidth({ "PHONE" }), false, true)
                  )
                },
                width: "WIDE_PLUS"
              ),
              a!columnLayout(
                contents: {},
                width: "MEDIUM_PLUS",
                showWhen: a!isPageWidth({ "DESKTOP_WIDE" })
              )
            },
            alignVertical: "MIDDLE",
            stackWhen: {
              "PHONE",
              "TABLET_PORTRAIT",
              "TABLET_LANDSCAPE"
            }
          )
        },
        style: "NONE"
      )
    ),
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(
              contents: {
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextIcon(icon: "calendar", color: "#274e13")
                        }
                      ),
                      width: "MINIMIZE"
                    ),
                    a!sideBySideItem(
                      item: a!dropdownField(
                        label: "Countries Filter",
                        labelPosition: "COLLAPSED",
                        choiceLabels: {
                          "2021 Full Year",
                          "Option 2",
                          "Option 3",
                          "Option 4",
                          "Option 5",
                          "Option 6",
                          "Option 7",
                          "Option 8",
                          "Option 9",
                          "Option 10",
                          "Option 11",
                          "Option 12"
                        },
                        choiceValues: { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
                        value: 1,
                        saveInto: {},
                        searchDisplay: "AUTO",
                        validations: {}
                      )
                    )
                  },
                  alignVertical: "MIDDLE"
                )
              },
              width: "NARROW_PLUS"
            ),
            a!columnLayout(contents: {}),
            a!columnLayout(
              contents: {
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextIcon(icon: "globe-alt", color: "#274e13")
                        }
                      ),
                      width: "MINIMIZE"
                    ),
                    a!sideBySideItem(
                      item: a!dropdownField(
                        label: "Countries Filter",
                        labelPosition: "COLLAPSED",
                        choiceLabels: {
                          "All countries",
                          "Option 2",
                          "Option 3",
                          "Option 4",
                          "Option 5",
                          "Option 6",
                          "Option 7",
                          "Option 8",
                          "Option 9",
                          "Option 10",
                          "Option 11",
                          "Option 12"
                        },
                        choiceValues: { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
                        value: 1,
                        saveInto: {},
                        searchDisplay: "AUTO",
                        validations: {}
                      )
                    ),
                    a!sideBySideItem(
                      item: a!dropdownField(
                        label: "Regions Filter",
                        labelPosition: "COLLAPSED",
                        choiceLabels: {
                          "All regions",
                          "Option 2",
                          "Option 3",
                          "Option 4",
                          "Option 5",
                          "Option 6",
                          "Option 7",
                          "Option 8",
                          "Option 9",
                          "Option 10",
                          "Option 11",
                          "Option 12"
                        },
                        choiceValues: { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12 },
                        value: 1,
                        saveInto: {},
                        searchDisplay: "AUTO",
                        validations: {}
                      )
                    )
                  },
                  alignVertical: "MIDDLE"
                )
              },
              width: "MEDIUM_PLUS"
            )
          }
        )
      },
      height: "AUTO",
      style: "#85c47d",
      padding: "STANDARD",
      marginBelow: "LESS",
      showBorder: false
    )
  },
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Energy Consumption",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!columnsLayout(
                      columns: {
                        a!columnLayout(
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "203,194 " },
                                        size: "LARGE",
                                        style: { "STRONG" }
                                      ),
                                      "MTCO2e",
                                      a!richTextItem(
                                        text: { " " },
                                        color: "SECONDARY",
                                        size: "LARGE"
                                      )
                                    },
                                    marginAbove: "STANDARD",
                                    marginBelow: "NONE"
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "MIDDLE",
                              marginBelow: "EVEN_LESS"
                            ),
                            a!tagField(
                              labelPosition: "COLLAPSED",
                              tags: {
                                a!tagItem(
                                  text: "93% REPORTING",
                                  backgroundColor: "#ff9900"
                                )
                              },
                              size: "SMALL"
                            )
                          },
                          width: "NARROW"
                        ),
                        a!columnLayout(
                          contents: {
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(text: { "257K" }, size: "STANDARD")
                              },
                              align: "CENTER",
                              marginBelow: "NONE"
                            ),
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(
                                  contents: {
                                    a!progressBarField(
                                      label: "",
                                      labelPosition: "COLLAPSED",
                                      percentage: 79,
                                      color: "#3a77e9",
                                      style: "THICK",
                                      marginAbove: "LESS",
                                      marginBelow: "LESS",
                                      showPercentage: false
                                    )
                                  },
                                  width: "AUTO"
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!progressBarField(
                                      label: "",
                                      labelPosition: "COLLAPSED",
                                      percentage: - 1,
                                      color: "NEGATIVE",
                                      style: "THICK",
                                      marginAbove: "LESS",
                                      marginBelow: "LESS",
                                      showPercentage: false
                                    )
                                  }
                                )
                              },
                              alignVertical: "MIDDLE",
                              marginAbove: "NONE",
                              marginBelow: "EVEN_LESS",
                              spacing: "NONE",
                              stackWhen: { "NEVER" },
                              showDividers: true
                            ),
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(text: { "TARGET" }, size: "SMALL")
                              },
                              align: "CENTER"
                            )
                          },
                          width: "AUTO"
                        )
                      },
                      alignVertical: "MIDDLE",
                      stackWhen: { "TABLET_LANDSCAPE", "DESKTOP_NARROW" }
                    )
                  },
                  link: a!dynamicLink(),
                  height: "AUTO",
                  style: "NONE",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              }
            )
          }
        ),
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Transportation",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!columnsLayout(
                      columns: {
                        a!columnLayout(
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "85,853 " },
                                        size: "LARGE",
                                        style: { "STRONG" }
                                      ),
                                      "MTCO2e",
                                      a!richTextItem(
                                        text: { " " },
                                        color: "SECONDARY",
                                        size: "LARGE"
                                      )
                                    },
                                    marginAbove: "STANDARD",
                                    marginBelow: "NONE"
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "MIDDLE",
                              marginBelow: "EVEN_LESS"
                            ),
                            a!tagField(
                              labelPosition: "COLLAPSED",
                              tags: {
                                a!tagItem(
                                  text: "100% REPORTING",
                                  backgroundColor: "SECONDARY"
                                )
                              },
                              size: "SMALL"
                            )
                          },
                          width: "NARROW"
                        ),
                        a!columnLayout(
                          contents: {
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(text: { "78K" }, size: "STANDARD")
                              },
                              align: "CENTER",
                              marginBelow: "NONE"
                            ),
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(
                                  contents: {
                                    a!progressBarField(
                                      label: "",
                                      labelPosition: "COLLAPSED",
                                      percentage: 100,
                                      color: "NEGATIVE",
                                      style: "THICK",
                                      marginAbove: "LESS",
                                      marginBelow: "LESS",
                                      showPercentage: false
                                    )
                                  },
                                  width: "AUTO"
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!progressBarField(
                                      label: "",
                                      labelPosition: "COLLAPSED",
                                      percentage: 10,
                                      color: "NEGATIVE",
                                      style: "THICK",
                                      marginAbove: "LESS",
                                      marginBelow: "LESS",
                                      showPercentage: false
                                    )
                                  }
                                )
                              },
                              alignVertical: "MIDDLE",
                              marginAbove: "NONE",
                              marginBelow: "EVEN_LESS",
                              spacing: "NONE",
                              stackWhen: { "NEVER" },
                              showDividers: true
                            ),
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(text: { "TARGET" }, size: "SMALL")
                              },
                              align: "CENTER"
                            )
                          },
                          width: "AUTO"
                        )
                      },
                      alignVertical: "MIDDLE",
                      stackWhen: { "TABLET_LANDSCAPE", "DESKTOP_NARROW" }
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              }
            )
          }
        ),
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Waste",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!columnsLayout(
                      columns: {
                        a!columnLayout(
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "25,472 " },
                                        size: "LARGE",
                                        style: { "STRONG" }
                                      ),
                                      "MTCO2e",
                                      a!richTextItem(
                                        text: { " " },
                                        color: "SECONDARY",
                                        size: "LARGE"
                                      )
                                    },
                                    marginAbove: "STANDARD",
                                    marginBelow: "NONE"
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "MIDDLE",
                              marginBelow: "EVEN_LESS"
                            ),
                            a!tagField(
                              labelPosition: "COLLAPSED",
                              tags: {
                                a!tagItem(
                                  text: "100% REPORTING",
                                  backgroundColor: "SECONDARY"
                                )
                              },
                              size: "SMALL"
                            )
                          },
                          width: "NARROW"
                        ),
                        a!columnLayout(
                          contents: {
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(text: { "34K" }, size: "STANDARD")
                              },
                              align: "CENTER",
                              marginBelow: "NONE"
                            ),
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(
                                  contents: {
                                    a!progressBarField(
                                      label: "",
                                      labelPosition: "COLLAPSED",
                                      percentage: 72,
                                      color: "#3a77e9",
                                      style: "THICK",
                                      marginAbove: "LESS",
                                      marginBelow: "LESS",
                                      showPercentage: false
                                    )
                                  },
                                  width: "AUTO"
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!progressBarField(
                                      label: "",
                                      labelPosition: "COLLAPSED",
                                      percentage: - 1,
                                      color: "NEGATIVE",
                                      style: "THICK",
                                      marginAbove: "LESS",
                                      marginBelow: "LESS",
                                      showPercentage: false
                                    )
                                  }
                                )
                              },
                              alignVertical: "MIDDLE",
                              marginAbove: "NONE",
                              marginBelow: "EVEN_LESS",
                              spacing: "NONE",
                              stackWhen: { "NEVER" },
                              showDividers: true
                            ),
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(text: { "TARGET" }, size: "SMALL")
                              },
                              align: "CENTER"
                            )
                          },
                          width: "AUTO"
                        )
                      },
                      alignVertical: "MIDDLE",
                      stackWhen: { "TABLET_LANDSCAPE", "DESKTOP_NARROW" }
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              }
            )
          }
        )
      },
      stackWhen: { "PHONE", "TABLET_PORTRAIT" }
    ),
    a!columnsLayout(
      columns: {
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Emissions over Time",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!areaChartField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      categories: {
                        "Jan",
                        "Feb",
                        "Mar",
                        "Apr",
                        "May",
                        "Jun",
                        "Jul",
                        "Aug",
                        "Sep",
                        "Oct",
                        "Nov",
                        "Dec"
                      },
                      series: {
                        a!chartSeries(
                          label: "Energy",
                          data: {
                            29.8,
                            28,
                            24.9,
                            21.5,
                            27.4,
                            27.2,
                            22.1,
                            29.9,
                            25.6,
                            26.4,
                            23.1,
                            25.3
                          }
                        ),
                        a!chartSeries(
                          label: "Transportation",
                          data: {
                            15.2,
                            19.8,
                            17.1,
                            16.7,
                            18.8,
                            15,
                            19.5,
                            19.4,
                            16.9,
                            16.7,
                            15.3,
                            16.6
                          }
                        ),
                        a!chartSeries(
                          label: "Waste",
                          data: {
                            7.1,
                            6.2,
                            7.1,
                            7.6,
                            7.9,
                            7.6,
                            6,
                            7.9,
                            6.5,
                            6.3,
                            6.6,
                            6.4
                          }
                        )
                      },
                      xAxisTitle: "2021",
                      yAxisTitle: "MTCO2e",
                      stacking: "NONE",
                      showLegend: true,
                      showTooltips: true,
                      colorScheme: a!colorSchemeCustom(colors: { "#59C968", "#41934B", "#117D20" }),
                      height: if(
                        a!isPageWidth(
                          {
                            "PHONE",
                            "TABLET_PORTRAIT",
                            "TABLET_LANDSCAPE",
                            "DESKTOP_NARROW"
                          }
                        ),
                        "SHORT",
                        "MEDIUM"
                      ),
                      xAxisStyle: "STANDARD",
                      yAxisStyle: "STANDARD"
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              }
            )
          }
        ),
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Emissions by Category",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!pieChartField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      series: {
                        a!chartSeries(label: "Energy", data: 314),
                        a!chartSeries(label: "Transportation", data: 219),
                        a!chartSeries(label: "Waste", data: 89)
                      },
                      colorScheme: a!colorSchemeCustom(
                        colors: {
                          "#59C968",
                          "#41934B",
                          "#117D20",
                          "#0A4A13"
                        }
                      ),
                      style: "DONUT",
                      seriesLabelStyle: if(
                        a!isPageWidth(
                          {
                            "PHONE",
                            "TABLET_PORTRAIT",
                            "TABLET_LANDSCAPE",
                            "DESKTOP_NARROW"
                          }
                        ),
                        "LEGEND",
                        "ON_CHART"
                      ),
                      height: if(
                        a!isPageWidth(
                          {
                            "PHONE",
                            "TABLET_PORTRAIT",
                            "TABLET_LANDSCAPE",
                            "DESKTOP_NARROW"
                          }
                        ),
                        "SHORT",
                        "MEDIUM"
                      )
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              }
            )
          }
        ),
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Emissions by Scope",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!pieChartField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      series: {
                        a!chartSeries(label: "Scope 1", data: 27),
                        a!chartSeries(label: "Scope 2", data: 287),
                        a!chartSeries(label: "Scope 3", data: 308)
                      },
                      colorScheme: a!colorSchemeCustom(
                        colors: {
                          "#59C968",
                          "#41934B",
                          "#117D20",
                          "#0A4A13"
                        }
                      ),
                      style: "DONUT",
                      seriesLabelStyle: if(
                        a!isPageWidth(
                          {
                            "PHONE",
                            "TABLET_PORTRAIT",
                            "TABLET_LANDSCAPE",
                            "DESKTOP_NARROW"
                          }
                        ),
                        "LEGEND",
                        "ON_CHART"
                      ),
                      height: if(
                        a!isPageWidth(
                          {
                            "PHONE",
                            "TABLET_PORTRAIT",
                            "TABLET_LANDSCAPE",
                            "DESKTOP_NARROW"
                          }
                        ),
                        "SHORT",
                        "MEDIUM"
                      )
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              }
            )
          }
        )
      },
      stackWhen: { "PHONE", "TABLET_PORTRAIT" }
    ),
    a!sectionLayout(
      label: "Emissions per Unit Produced",
      labelHeadingTag: "H2",
      labelColor: "STANDARD",
      contents: {
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(
                          text: { "ENERGY (SCOPE 1)" },
                          color: "SECONDARY"
                        )
                      }
                    ),
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!stampField(
                            labelPosition: "COLLAPSED",
                            icon: "bolt",
                            contentColor: "STANDARD",
                            size: "TINY"
                          ),
                          width: "MINIMIZE"
                        ),
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: {
                                  a!richTextItem(text: { "0.020 " }, size: "MEDIUM_PLUS"),
                                  a!richTextItem(text: { "MTCO2e" }, size: "STANDARD")
                                },
                                color: "STANDARD"
                              )
                            }
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  }
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(text: { "+" }, size: "MEDIUM_PLUS")
                      },
                      align: if(
                        a!isPageWidth(
                          {
                            "PHONE",
                            "TABLET_PORTRAIT",
                            "TABLET_LANDSCAPE",
                            "DESKTOP_NARROW"
                          }
                        ),
                        "LEFT",
                        "CENTER"
                      )
                    )
                  },
                  width: "EXTRA_NARROW"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(
                          text: { "ENERGY (SCOPE 2)" },
                          color: "SECONDARY"
                        )
                      }
                    ),
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!stampField(
                            labelPosition: "COLLAPSED",
                            icon: "plug",
                            contentColor: "STANDARD",
                            size: "TINY"
                          ),
                          width: "MINIMIZE"
                        ),
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: {
                                  a!richTextItem(text: { "0.157 " }, size: "MEDIUM_PLUS"),
                                  a!richTextItem(text: { "MTCO2e" }, size: "STANDARD")
                                },
                                color: "STANDARD"
                              )
                            }
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  }
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(text: { "+" }, size: "MEDIUM_PLUS")
                      },
                      align: if(
                        a!isPageWidth(
                          {
                            "PHONE",
                            "TABLET_PORTRAIT",
                            "TABLET_LANDSCAPE",
                            "DESKTOP_NARROW"
                          }
                        ),
                        "LEFT",
                        "CENTER"
                      )
                    )
                  },
                  width: "EXTRA_NARROW"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(
                          text: { "TRANSPORTATION" },
                          color: "SECONDARY"
                        )
                      }
                    ),
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!stampField(
                            labelPosition: "COLLAPSED",
                            icon: "truck-moving",
                            contentColor: "STANDARD",
                            size: "TINY"
                          ),
                          width: "MINIMIZE"
                        ),
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: {
                                  a!richTextItem(text: { "0.123 " }, size: "MEDIUM_PLUS"),
                                  a!richTextItem(text: { "MTCO2e" }, size: "STANDARD")
                                },
                                color: "STANDARD"
                              )
                            }
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  }
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(text: { "+" }, size: "MEDIUM_PLUS")
                      },
                      align: if(
                        a!isPageWidth(
                          {
                            "PHONE",
                            "TABLET_PORTRAIT",
                            "TABLET_LANDSCAPE",
                            "DESKTOP_NARROW"
                          }
                        ),
                        "LEFT",
                        "CENTER"
                      )
                    )
                  },
                  width: "EXTRA_NARROW"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(text: { "WASTE" }, color: "SECONDARY")
                      }
                    ),
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!stampField(
                            labelPosition: "COLLAPSED",
                            icon: "trash",
                            contentColor: "STANDARD",
                            size: "TINY"
                          ),
                          width: "MINIMIZE"
                        ),
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: {
                                  a!richTextItem(text: { "0.045 " }, size: "MEDIUM_PLUS"),
                                  a!richTextItem(text: { "MTCO2e" }, size: "STANDARD")
                                },
                                color: "STANDARD"
                              )
                            }
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  }
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(text: { "=" }, size: "MEDIUM_PLUS")
                      },
                      align: if(
                        a!isPageWidth(
                          {
                            "PHONE",
                            "TABLET_PORTRAIT",
                            "TABLET_LANDSCAPE",
                            "DESKTOP_NARROW"
                          }
                        ),
                        "LEFT",
                        "CENTER"
                      )
                    )
                  },
                  width: "EXTRA_NARROW"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(
                          text: { "TOTAL" },
                          color: "SECONDARY",
                          style: { "STRONG" }
                        )
                      }
                    ),
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!stampField(
                            labelPosition: "COLLAPSED",
                            icon: "smog",
                            contentColor: "STANDARD",
                            size: "TINY"
                          ),
                          width: "MINIMIZE"
                        ),
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: {
                                  a!richTextItem(
                                    text: {
                                      a!richTextItem(text: { "0.320" }, style: { "STRONG" }),
                                      " "
                                    },
                                    size: "MEDIUM_PLUS"
                                  ),
                                  a!richTextItem(text: { "MTCO2e" }, size: "STANDARD")
                                },
                                color: "STANDARD"
                              )
                            }
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  }
                )
              },
              alignVertical: "MIDDLE",
              stackWhen: {
                "PHONE",
                "TABLET_PORTRAIT",
                "TABLET_LANDSCAPE",
                "DESKTOP_NARROW"
              },
              showDividers: false
            )
          },
          height: "AUTO",
          style: "NONE",
          padding: "STANDARD",
          marginBelow: "STANDARD",
          showBorder: false,
          showShadow: true
        )
      }
    )
  },
  backgroundColor: "TRANSPARENT"
)
