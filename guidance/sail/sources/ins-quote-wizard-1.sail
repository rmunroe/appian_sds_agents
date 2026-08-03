a!localVariables(
  local!zipCode: null(),
  local!stepNumber: 2,
  local!bundleSelections: {},
  local!showSaveForLater: false,
  choose(
    local!stepNumber,
    a!headerContentLayout(
      header: {
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!imageField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      /* This is a placeholder image; replace as needed */
                      images: {
                        a!documentImage(
                          document: a!EXAMPLE_DOCUMENT_IMAGE()
                        )
                      },
                      size: if(
                        a!isPageWidth({ "PHONE" }),
                        "FIT",
                        "MEDIUM"
                      ),
                      isThumbnail: false,
                      style: "STANDARD"
                    )
                  }
                ),
                a!columnLayout(
                  contents: {
                    a!buttonArrayLayout(
                      buttons: {
                        a!buttonWidget(
                          label: "ENGLISH",
                          size: "SMALL",
                          width: "MINIMIZE",
                          style: "OUTLINE"
                        ),
                        a!buttonWidget(
                          label: "Español",
                          size: "SMALL",
                          width: "MINIMIZE",
                          style: "LINK"
                        )
                      },
                      align: "END",
                      marginBelow: "NONE"
                    )
                  },
                  width: "NARROW"
                )
              },
              alignVertical: "MIDDLE",
              stackWhen: "NEVER"
            )
          },
          height: "AUTO",
          style: "#73245d",
          marginBelow: "NONE",
          showBorder: false
        ),
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(contents: {}),
                a!columnLayout(
                  contents: {
                    a!cardLayout(
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: {
                                "Great rates, great service, and great protection."
                              },
                              color: "#434343",
                              size: "LARGE",
                              style: { "STRONG" }
                            ),
                            " "
                          },
                          marginAbove: "NONE",
                          marginBelow: "MORE"
                        ),
                        a!cardLayout(
                          contents: {
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Get your no-obligation quote now" },
                                  color: "#434343",
                                  size: "MEDIUM",
                                  style: { "STRONG" }
                                )
                              },
                              align: "CENTER",
                              marginBelow: "STANDARD"
                            ),
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(contents: {}),
                                a!columnLayout(
                                  contents: {
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!textField(
                                            label: "Your ZIP Code",
                                            labelPosition: "COLLAPSED",
                                            placeholder: "Enter your 5-digit ZIP code",
                                            saveInto: local!zipCode,
                                            refreshAfter: "UNFOCUS",
                                            validations: {}
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!buttonArrayLayout(
                                            buttons: {
                                              a!buttonWidget(
                                                label: "Get Started",
                                                value: 2,
                                                saveInto: local!stepNumber,
                                                size: "STANDARD",
                                                style: "OUTLINE"
                                              )
                                            },
                                            align: "START",
                                            marginBelow: "NONE"
                                          ),
                                          width: "MINIMIZE"
                                        )
                                      },
                                      alignVertical: "MIDDLE"
                                    )
                                  },
                                  width: "MEDIUM"
                                ),
                                a!columnLayout(contents: {})
                              },
                              alignVertical: "MIDDLE"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          padding: "MORE",
                          marginBelow: "STANDARD",
                          showBorder: false,
                          decorativeBarPosition: "TOP",
                          decorativeBarColor: "#BF04A0"
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: {
                                "We may use information from public sources or third parties, such as driving records, claim history, vehicle driving data, and credit reports to provide you with the best quote. "
                              },
                              color: "#666666",
                              size: "SMALL"
                            ),
                            char(10),
                            char(10),
                            a!richTextItem(
                              text: {
                                "Some discounts, coverages, payment plans, and features are not available in all states."
                              },
                              color: "#666666",
                              size: "SMALL"
                            )
                          }
                        )
                      },
                      height: "AUTO",
                      style: "#efefef",
                      padding: "EVEN_MORE",
                      marginBelow: "NONE",
                      showBorder: false
                    )
                  },
                  width: "WIDE"
                ),
                a!columnLayout(contents: {}),
                a!columnLayout(
                  contents: {
                    a!imageField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      images: {
                        a!webImage(
                          source: "https://images.pexels.com/photos/3785391/pexels-photo-3785391.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
                        )
                      },
                      size: "FIT",
                      isThumbnail: false,
                      style: "STANDARD"
                    )
                  },
                  width: "WIDE"
                )
              },
              alignVertical: "MIDDLE",
              marginBelow: "NONE",
              stackWhen: {
                "PHONE",
                "TABLET_PORTRAIT",
                "TABLET_LANDSCAPE"
              }
            )
          },
          height: "AUTO",
          style: "#efefef",
          padding: "NONE",
          marginBelow: "NONE",
          showBorder: false
        ),
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!imageField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      images: {
                        a!webImage(
                          source: "https://images.pexels.com/photos/9518015/pexels-photo-9518015.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
                        )
                      },
                      size: "FIT",
                      isThumbnail: false,
                      style: "STANDARD"
                    )
                  },
                  width: "WIDE"
                ),
                a!columnLayout(contents: {}),
                a!columnLayout(
                  contents: {
                    a!cardLayout(
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: {
                                "Get just the right amount of coverage for your needs"
                              },
                              color: "STANDARD",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            )
                          },
                          marginAbove: "NONE",
                          marginBelow: "MORE"
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { a!richTextIcon(icon: "check-circle") },
                              color: "STANDARD",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            ),
                            a!richTextItem(
                              text: {
                                a!richTextItem(text: { " " }, style: { "STRONG" }),
                                "Liability Coverage"
                              },
                              size: "MEDIUM_PLUS"
                            )
                          }
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { a!richTextIcon(icon: "check-circle") },
                              color: "STANDARD",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            ),
                            a!richTextItem(
                              text: {
                                a!richTextItem(text: { " " }, style: { "STRONG" }),
                                "Uninsured and Underinsured Motorist Coverage"
                              },
                              size: "MEDIUM_PLUS"
                            )
                          }
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { a!richTextIcon(icon: "check-circle") },
                              color: "STANDARD",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            ),
                            a!richTextItem(
                              text: {
                                a!richTextItem(text: { " " }, style: { "STRONG" }),
                                "Comprehensive Coverage"
                              },
                              size: "MEDIUM_PLUS"
                            )
                          }
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { a!richTextIcon(icon: "check-circle") },
                              color: "STANDARD",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            ),
                            a!richTextItem(
                              text: {
                                a!richTextItem(text: { " " }, style: { "STRONG" }),
                                "Collision Coverage"
                              },
                              size: "MEDIUM_PLUS"
                            )
                          }
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { a!richTextIcon(icon: "check-circle") },
                              color: "STANDARD",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            ),
                            a!richTextItem(
                              text: {
                                a!richTextItem(text: { " " }, style: { "STRONG" }),
                                "Medical Payments Coverage"
                              },
                              size: "MEDIUM_PLUS"
                            )
                          }
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { a!richTextIcon(icon: "check-circle") },
                              color: "STANDARD",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            ),
                            a!richTextItem(
                              text: {
                                a!richTextItem(text: { " " }, style: { "STRONG" }),
                                "Personal Injury Protection"
                              },
                              size: "MEDIUM_PLUS"
                            )
                          }
                        )
                      },
                      height: "AUTO",
                      style: "#73245d",
                      padding: "MORE",
                      marginBelow: "NONE",
                      showBorder: false
                    )
                  },
                  width: "WIDE"
                ),
                a!columnLayout(contents: {})
              },
              alignVertical: "MIDDLE",
              marginBelow: "NONE",
              stackWhen: {
                "PHONE",
                "TABLET_PORTRAIT",
                "TABLET_LANDSCAPE"
              }
            )
          },
          height: "AUTO",
          style: "#73245d",
          padding: "NONE",
          marginBelow: "NONE",
          showBorder: false
        ),
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!imageField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      /* This is a placeholder image; replace as needed */
                      images: {
                        a!documentImage(
                          document: a!EXAMPLE_DOCUMENT_IMAGE()
                        )
                      },
                      size: "MEDIUM",
                      isThumbnail: false,
                      style: "STANDARD"
                    )
                  },
                  width: "MEDIUM"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        "We may use information from public sources or third parties, such as driving records, claim history, vehicle driving data, and credit reports to provide you with the best quote.",
                        char(10),
                        char(10),
                        "Some discounts, coverages, payment plans, and features are not available in all states.",
                        char(10),
                        char(10),
                        "This site exists for demonstration purposes only. We can't actually sell you auto insurance."
                      }
                    )
                  }
                )
              },
              stackWhen: { "PHONE", "TABLET_PORTRAIT" }
            )
          },
          height: "TALL",
          style: "#333",
          padding: "EVEN_MORE",
          marginBelow: "STANDARD",
          showBorder: false,
          decorativeBarPosition: "NONE",
          decorativeBarColor: "#056CF2"
        )
      },
      contents: {},
      backgroundColor: "#333",
      contentsPadding: "NONE"
    ),
    a!headerContentLayout(
      header: {
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!imageField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      /* This is a placeholder image; replace as needed */
                      images: {
                        a!documentImage(
                          document: a!EXAMPLE_DOCUMENT_IMAGE()
                        )
                      },
                      size: if(
                        a!isPageWidth({ "PHONE" }),
                        "FIT",
                        "MEDIUM"
                      ),
                      isThumbnail: false,
                      style: "STANDARD"
                    )
                  }
                ),
                a!columnLayout(
                  contents: {
                    a!buttonArrayLayout(
                      buttons: {
                        a!buttonWidget(
                          label: "ENGLISH",
                          size: "SMALL",
                          width: "MINIMIZE",
                          style: "OUTLINE"
                        ),
                        a!buttonWidget(
                          label: "Español",
                          size: "SMALL",
                          width: "MINIMIZE",
                          style: "LINK"
                        )
                      },
                      align: "END",
                      marginBelow: "NONE"
                    )
                  },
                  width: "NARROW"
                )
              },
              alignVertical: "MIDDLE",
              stackWhen: "NEVER"
            )
          },
          height: "AUTO",
          style: "#73245d",
          marginBelow: "NONE",
          showBorder: false
        ),
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(contents: {}),
                a!columnLayout(
                  contents: {
                    a!sectionLayout(
                      label: "",
                      labelSize: "MEDIUM",
                      labelColor: "STANDARD",
                      contents: {
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "piggy-bank",
                                  backgroundColor: "ACCENT",
                                  contentColor: "STANDARD",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Completed Step"
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
                                      text: { "Bundled Savings" },
                                      size: "STANDARD",
                                      style: { "STRONG" }
                                    )
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Current Step (1 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginAbove: "STANDARD",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "portrait",
                                  backgroundColor: "#d9d9d9",
                                  contentColor: "#666666",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(text: { "About You" }, size: "STANDARD")
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step (2 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "car",
                                  backgroundColor: "#d9d9d9",
                                  contentColor: "#666666",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(text: { "Your Vehicles" }, size: "STANDARD")
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step (3 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "user-friends",
                                  backgroundColor: "#d9d9d9",
                                  contentColor: "#666666",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(text: { "Other Drivers" }, size: "STANDARD")
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step (4 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "umbrella",
                                  backgroundColor: "#d9d9d9",
                                  contentColor: "#666666",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
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
                                      text: { "Coverage Options" },
                                      size: "STANDARD"
                                    )
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step (5 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "clipboard-check",
                                  backgroundColor: "#d9d9d9",
                                  contentColor: "#666666",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(text: { "Quote" }, size: "STANDARD")
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step (6 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        )
                      },
                      showWhen: a!isPageWidth(pageWidths: { "DESKTOP", "DESKTOP_WIDE" })
                    )
                  },
                  width: "NARROW_PLUS"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(
                          text: { "Save more with a bundled quote" },
                          size: "LARGE"
                        )
                      },
                      marginBelow: "MORE"
                    ),
                    if(
                      a!isPageWidth({ "PHONE" }),
                      a!cardChoiceField(
                        label: "Insurance Options 1",
                        labelPosition: "COLLAPSED",
                        data: {
                          a!map(
                            id: 1,
                            icon: "car",
                            primaryText: "Auto",
                            secondaryText: "Cars & SUVs"
                          )
                        },
                        cardTemplate: a!cardTemplateBarTextJustified(
                          id: fv!data.id,
                          primaryText: fv!data.primaryText,
                          secondaryText: fv!data.secondaryText,
                          icon: fv!data.icon
                        ),
                        value: 1,
                        saveInto: {},
                        maxSelections: 1,
                        validations: {}
                      ),
                      a!cardChoiceField(
                        label: "Insurance Options 1",
                        labelPosition: "COLLAPSED",
                        data: {
                          a!map(
                            id: 1,
                            icon: "car",
                            primaryText: "Auto",
                            secondaryText: "Cars & SUVs"
                          )
                        },
                        cardTemplate: a!cardTemplateBarTextStacked(
                          id: fv!data.id,
                          primaryText: fv!data.primaryText,
                          secondaryText: fv!data.secondaryText,
                          icon: fv!data.icon
                        ),
                        value: 1,
                        saveInto: {},
                        maxSelections: 1,
                        validations: {}
                      )
                    ),
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(
                          text: {
                            "Save as much as ",
                            a!richTextItem(text: { "25%" }, style: { "STRONG" }),
                            " by bundling multiple policies today."
                          },
                          size: "MEDIUM"
                        ),
                        char(10),
                        char(10),
                        a!richTextItem(
                          text: { "What else do you want to protect?" },
                          size: "MEDIUM",
                          style: { "STRONG" }
                        )
                      },
                      marginAbove: "MORE",
                      marginBelow: "MORE"
                    ),
                    if(
                      a!isPageWidth({ "PHONE" }),
                      a!cardChoiceField(
                        label: "Insurance Options 1",
                        labelPosition: "COLLAPSED",
                        data: {
                          a!map(
                            id: 1,
                            icon: "home",
                            primaryText: "Homeowners",
                            secondaryText: "Single-family & townhomes"
                          ),
                          a!map(
                            id: 2,
                            icon: "building",
                            primaryText: "Renters",
                            secondaryText: "Rental homes & apartments"
                          ),
                          a!map(
                            id: 3,
                            icon: "motorcycle",
                            primaryText: "Other Vehicles",
                            secondaryText: "Motorcycles & ATVs"
                          )
                        },
                        cardTemplate: a!cardTemplateBarTextJustified(
                          id: fv!data.id,
                          primaryText: fv!data.primaryText,
                          secondaryText: fv!data.secondaryText,
                          icon: fv!data.icon
                        ),
                        value: local!bundleSelections,
                        saveInto: local!bundleSelections,
                        maxSelections: 3,
                        validations: {}
                      ),
                      a!cardChoiceField(
                        label: "Insurance Options 1",
                        labelPosition: "COLLAPSED",
                        data: {
                          a!map(
                            id: 1,
                            icon: "home",
                            primaryText: "Homeowners",
                            secondaryText: "Single-family & townhomes"
                          ),
                          a!map(
                            id: 2,
                            icon: "building",
                            primaryText: "Renters",
                            secondaryText: "Rental homes & apartments"
                          ),
                          a!map(
                            id: 3,
                            icon: "motorcycle",
                            primaryText: "Other Vehicles",
                            secondaryText: "Motorcycles & ATVs"
                          )
                        },
                        cardTemplate: a!cardTemplateBarTextStacked(
                          id: fv!data.id,
                          primaryText: fv!data.primaryText,
                          secondaryText: fv!data.secondaryText,
                          icon: fv!data.icon
                        ),
                        value: local!bundleSelections,
                        saveInto: local!bundleSelections,
                        maxSelections: 3,
                        validations: {}
                      )
                    ),
                    a!sectionLayout(
                      label: "",
                      contents: {
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(contents: {}),
                            a!columnLayout(
                              contents: {
                                a!buttonArrayLayout(
                                  buttons: {
                                    a!buttonWidget(
                                      label: "Next: About You",
                                      value: 3,
                                      saveInto: local!stepNumber,
                                      size: "LARGE",
                                      style: "SOLID"
                                    )
                                  },
                                  align: "END"
                                )
                              }
                            )
                          }
                        )
                      },
                      divider: "ABOVE",
                      marginAbove: "EVEN_MORE"
                    )
                  },
                  width: "WIDE"
                ),
                a!columnLayout(contents: {})
              },
              marginAbove: if(
                a!isPageWidth({ "PHONE" }),
                "LESS",
                "EVEN_MORE"
              ),
              marginBelow: if(
                a!isPageWidth({ "PHONE" }),
                "LESS",
                "EVEN_MORE"
              ),
              stackWhen: {
                "PHONE",
                "TABLET_PORTRAIT",
                "TABLET_LANDSCAPE",
                "DESKTOP_NARROW"
              }
            ),
            a!cardLayout(
              contents: {},
              height: "SHORT_PLUS",
              style: "NONE",
              marginBelow: "STANDARD",
              showBorder: false
            )
          },
          height: "AUTO",
          style: "NONE",
          marginBelow: "NONE",
          showBorder: false
        ),
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!imageField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      /* This is a placeholder image; replace as needed */
                      images: {
                        a!documentImage(
                          document: a!EXAMPLE_DOCUMENT_IMAGE()
                        )
                      },
                      size: "MEDIUM",
                      isThumbnail: false,
                      style: "STANDARD"
                    )
                  },
                  width: "MEDIUM"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        "We may use information from public sources or third parties, such as driving records, claim history, vehicle driving data, and credit reports to provide you with the best quote.",
                        char(10),
                        char(10),
                        "Some discounts, coverages, payment plans, and features are not available in all states.",
                        char(10),
                        char(10),
                        "This site exists for demonstration purposes only. We can't actually sell you auto insurance."
                      }
                    )
                  }
                )
              },
              stackWhen: { "PHONE", "TABLET_PORTRAIT" }
            )
          },
          height: "TALL",
          style: "#333",
          padding: "EVEN_MORE",
          marginBelow: "STANDARD",
          showBorder: false,
          decorativeBarPosition: "NONE",
          decorativeBarColor: "#056CF2"
        )
      },
      contents: {},
      backgroundColor: "#333",
      contentsPadding: "NONE"
    ),
    a!headerContentLayout(
      header: {
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!imageField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      /* This is a placeholder image; replace as needed */
                      images: {
                        a!documentImage(
                          document: a!EXAMPLE_DOCUMENT_IMAGE()
                        )
                      },
                      size: if(
                        a!isPageWidth({ "PHONE" }),
                        "FIT",
                        "MEDIUM"
                      ),
                      isThumbnail: false,
                      style: "STANDARD"
                    )
                  }
                ),
                a!columnLayout(
                  contents: {
                    a!buttonArrayLayout(
                      buttons: {
                        a!buttonWidget(
                          label: "ENGLISH",
                          size: "SMALL",
                          width: "MINIMIZE",
                          style: "OUTLINE"
                        ),
                        a!buttonWidget(
                          label: "Español",
                          size: "SMALL",
                          width: "MINIMIZE",
                          style: "LINK"
                        )
                      },
                      align: "END",
                      marginBelow: "NONE"
                    )
                  },
                  width: "NARROW"
                )
              },
              alignVertical: "MIDDLE",
              stackWhen: "NEVER"
            )
          },
          height: "AUTO",
          style: "#73245d",
          marginBelow: "NONE",
          showBorder: false
        ),
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(contents: {}),
                a!columnLayout(
                  contents: {
                    a!sectionLayout(
                      label: "",
                      labelSize: "MEDIUM",
                      labelColor: "STANDARD",
                      contents: {
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "piggy-bank",
                                  backgroundColor: "ACCENT",
                                  contentColor: "STANDARD",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Completed Step"
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
                                      text: { "Bundled Savings" },
                                      size: "STANDARD"
                                    )
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Completed Step (1 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginAbove: "STANDARD",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "portrait",
                                  backgroundColor: "ACCENT",
                                  contentColor: "STANDARD",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Current Step"
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
                                      text: { "About You" },
                                      size: "STANDARD",
                                      style: { "STRONG" }
                                    )
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Current Step (2 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "car",
                                  backgroundColor: "#d9d9d9",
                                  contentColor: "#666666",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(text: { "Your Vehicles" }, size: "STANDARD")
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step (3 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "user-friends",
                                  backgroundColor: "#d9d9d9",
                                  contentColor: "#666666",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(text: { "Other Drivers" }, size: "STANDARD")
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step (4 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "umbrella",
                                  backgroundColor: "#d9d9d9",
                                  contentColor: "#666666",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
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
                                      text: { "Coverage Options" },
                                      size: "STANDARD"
                                    )
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step (5 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "clipboard-check",
                                  backgroundColor: "#d9d9d9",
                                  contentColor: "#666666",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(text: { "Quote" }, size: "STANDARD")
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step (6 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        )
                      },
                      showWhen: a!isPageWidth(pageWidths: { "DESKTOP", "DESKTOP_WIDE" })
                    )
                  },
                  width: "NARROW_PLUS"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(
                          text: { "Please tell us a bit about you" },
                          size: "LARGE"
                        )
                      },
                      marginBelow: "MORE"
                    ),
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!textField(
                            label: "First Name",
                            labelPosition: "ABOVE",
                            saveInto: {},
                            refreshAfter: "UNFOCUS",
                            validations: {}
                          ),
                          width: "4X"
                        ),
                        a!sideBySideItem(
                          item: a!textField(
                            label: "M.I.",
                            labelPosition: "ABOVE",
                            saveInto: {},
                            refreshAfter: "UNFOCUS",
                            validations: {}
                          )
                        ),
                        a!sideBySideItem(
                          item: a!textField(
                            label: "Last Name",
                            labelPosition: "ABOVE",
                            saveInto: {},
                            refreshAfter: "UNFOCUS",
                            validations: {}
                          ),
                          width: "4X"
                        ),
                        a!sideBySideItem(
                          item: a!dropdownField(
                            label: "Suffix",
                            labelPosition: "ABOVE",
                            placeholder: "",
                            choiceLabels: {
                              "None",
                              "Sr.",
                              "Jr.",
                              "II",
                              "III",
                              "IV",
                              "V",
                              "VI",
                              "VII"
                            },
                            choiceValues: { 1, 2, 3, 4, 5, 6, 7, 8, 9 },
                            value: 1,
                            saveInto: {},
                            searchDisplay: "AUTO",
                            validations: {}
                          ),
                          width: "2X"
                        )
                      },
                      marginBelow: "MORE"
                    ),
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!textField(
                            label: "Street Address",
                            labelPosition: "ABOVE",
                            saveInto: {},
                            refreshAfter: "UNFOCUS",
                            validations: {}
                          ),
                          width: "3X"
                        ),
                        a!sideBySideItem(
                          item: a!textField(
                            label: "Apt / Unit No.",
                            labelPosition: "ABOVE",
                            saveInto: {},
                            refreshAfter: "UNFOCUS",
                            validations: {}
                          )
                        )
                      }
                    ),
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!textField(
                            label: "City",
                            labelPosition: "ABOVE",
                            saveInto: {},
                            refreshAfter: "UNFOCUS",
                            validations: {}
                          ),
                          width: "4X"
                        ),
                        a!sideBySideItem(
                          item: a!textField(
                            label: "State",
                            labelPosition: "ABOVE",
                            value: "VA",
                            saveInto: {},
                            refreshAfter: "UNFOCUS",
                            readOnly: true,
                            validations: {}
                          )
                        ),
                        a!sideBySideItem(
                          item: a!textField(
                            label: "ZIP Code",
                            labelPosition: "ABOVE",
                            value: "22102",
                            saveInto: {},
                            refreshAfter: "UNFOCUS",
                            readOnly: true,
                            validations: {}
                          )
                        ),
                        a!sideBySideItem(width: "2X")
                      },
                      marginBelow: "MORE"
                    ),
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!dateField(
                            label: "Date of Birth",
                            labelPosition: "ABOVE",
                            saveInto: {},
                            validations: {}
                          )
                        ),
                        a!sideBySideItem(width: "2X")
                      },
                      marginBelow: "MORE"
                    ),
                    a!cardLayout(
                      contents: {
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextIcon(
                                    icon: "shield",
                                    color: "ACCENT",
                                    size: "LARGE"
                                  )
                                }
                              ),
                              width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: { "Your information is safe with us." },
                                    style: { "STRONG" }
                                  ),
                                  " We will never share it with other parties. This information will be used to provide the best quote for your insurance needs."
                                }
                              )
                            )
                          },
                          alignVertical: "MIDDLE"
                        )
                      },
                      height: "AUTO",
                      style: "#f8eff3",
                      padding: "STANDARD",
                      marginBelow: "NONE",
                      decorativeBarPosition: "START"
                    ),
                    a!sectionLayout(
                      label: "",
                      contents: {
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(contents: {}),
                            a!columnLayout(
                              contents: {
                                a!buttonArrayLayout(
                                  buttons: {
                                    a!buttonWidget(
                                      label: "Next: Your Vehicles",
                                      value: 4,
                                      saveInto: local!stepNumber,
                                      size: "LARGE",
                                      style: "SOLID"
                                    )
                                  },
                                  align: "END"
                                )
                              }
                            )
                          }
                        )
                      },
                      divider: "ABOVE",
                      marginAbove: "EVEN_MORE"
                    )
                  },
                  width: "WIDE"
                ),
                a!columnLayout(contents: {})
              },
              marginAbove: "EVEN_MORE",
              marginBelow: "EVEN_MORE",
              stackWhen: {
                "PHONE",
                "TABLET_PORTRAIT",
                "TABLET_LANDSCAPE",
                "DESKTOP_NARROW"
              }
            ),
            a!cardLayout(
              contents: {},
              height: "SHORT_PLUS",
              style: "NONE",
              marginBelow: "STANDARD",
              showBorder: false
            )
          },
          height: "AUTO",
          style: "NONE",
          marginBelow: "NONE",
          showBorder: false
        ),
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!imageField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      /* This is a placeholder image; replace as needed */
                      images: {
                        a!documentImage(
                          document: a!EXAMPLE_DOCUMENT_IMAGE()
                        )
                      },
                      size: "MEDIUM",
                      isThumbnail: false,
                      style: "STANDARD"
                    )
                  },
                  width: "MEDIUM"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        "We may use information from public sources or third parties, such as driving records, claim history, vehicle driving data, and credit reports to provide you with the best quote.",
                        char(10),
                        char(10),
                        "Some discounts, coverages, payment plans, and features are not available in all states.",
                        char(10),
                        char(10),
                        "This site exists for demonstration purposes only. We can't actually sell you auto insurance."
                      }
                    )
                  }
                )
              },
              stackWhen: { "PHONE", "TABLET_PORTRAIT" }
            )
          },
          height: "TALL",
          style: "#333",
          padding: "EVEN_MORE",
          marginBelow: "STANDARD",
          showBorder: false,
          decorativeBarPosition: "NONE",
          decorativeBarColor: "#056CF2"
        )
      },
      contents: {},
      backgroundColor: "#333",
      contentsPadding: "NONE"
    ),
    a!headerContentLayout(
      header: {
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!imageField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      /* This is a placeholder image; replace as needed */
                      images: {
                        a!documentImage(
                          document: a!EXAMPLE_DOCUMENT_IMAGE()
                        )
                      },
                      size: if(
                        a!isPageWidth({ "PHONE" }),
                        "FIT",
                        "MEDIUM"
                      ),
                      isThumbnail: false,
                      style: "STANDARD"
                    )
                  }
                ),
                a!columnLayout(
                  contents: {
                    a!buttonArrayLayout(
                      buttons: {
                        a!buttonWidget(
                          label: "ENGLISH",
                          size: "SMALL",
                          width: "MINIMIZE",
                          style: "OUTLINE"
                        ),
                        a!buttonWidget(
                          label: "Español",
                          size: "SMALL",
                          width: "MINIMIZE",
                          style: "LINK"
                        )
                      },
                      align: "END",
                      marginBelow: "NONE"
                    )
                  },
                  width: "NARROW"
                )
              },
              alignVertical: "MIDDLE",
              stackWhen: "NEVER"
            )
          },
          height: "AUTO",
          style: "#73245d",
          marginBelow: "NONE",
          showBorder: false
        ),
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(contents: {}),
                a!columnLayout(
                  contents: {
                    a!sectionLayout(
                      label: "",
                      labelSize: "MEDIUM",
                      labelColor: "STANDARD",
                      contents: {
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "piggy-bank",
                                  backgroundColor: "ACCENT",
                                  contentColor: "STANDARD",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Completed Step"
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
                                      text: { "Bundled Savings" },
                                      color: "STANDARD",
                                      size: "STANDARD"
                                    )
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Completed Step (1 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginAbove: "STANDARD",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "portrait",
                                  backgroundColor: "ACCENT",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(text: { "About You" }, size: "STANDARD")
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Completed Step (2 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "car",
                                  backgroundColor: "ACCENT",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(text: { "Your Vehicles" }, size: "STANDARD")
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Completed Step (3 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "user-friends",
                                  backgroundColor: "ACCENT",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(
                              contents: {
                                a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(text: { "Other Drivers" }, size: "STANDARD")
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Completed Step (4 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "umbrella",
                                  backgroundColor: "ACCENT",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
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
                                      text: { "Coverage Options" },
                                      size: "STANDARD"
                                    )
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Completed Step (5 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  images: {
                                    a!documentImage(
                                      document: a!EXAMPLE_VERTICAL_CONNECTOR_IMAGE()
                                    )
                                  },
                                  size: "TINY",
                                  isThumbnail: false,
                                  style: "STANDARD",
                                  align: "CENTER"
                                )
                              },
                              width: "EXTRA_NARROW"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!stampField(
                                  labelPosition: "COLLAPSED",
                                  icon: "clipboard-check",
                                  backgroundColor: "ACCENT",
                                  contentColor: "STANDARD",
                                  size: "TINY",
                                  align: "CENTER",
                                  marginBelow: "NONE",
                                  accessibilityText: "Future Step"
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
                                      text: { "Quote" },
                                      size: "STANDARD",
                                      style: { "STRONG" }
                                    )
                                  },
                                  preventWrapping: true,
                                  align: "LEFT",
                                  marginAbove: "NONE",
                                  marginBelow: "NONE",
                                  accessibilityText: "Current Step (6 of 6)"
                                )
                              }
                            )
                          },
                          alignVertical: "MIDDLE",
                          marginBelow: "NONE",
                          spacing: "NONE"
                        )
                      },
                      showWhen: a!isPageWidth(pageWidths: { "DESKTOP", "DESKTOP_WIDE" })
                    )
                  },
                  width: "NARROW_PLUS"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(
                          text: { "Here's your personalized quote" },
                          size: "LARGE"
                        )
                      },
                      marginBelow: "MORE"
                    ),
                    a!cardLayout(
                      contents: {
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: {
                                      a!richTextItem(text: { "$113.50" }, style: { "STRONG" }),
                                      " "
                                    },
                                    size: "LARGE"
                                  ),
                                  a!richTextItem(text: { "/ Month" }, size: "MEDIUM")
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!buttonArrayLayout(
                                buttons: {
                                  a!buttonWidget(
                                    label: "Purchase Now",
                                    size: "LARGE",
                                    style: "SOLID"
                                  )
                                },
                                align: "START",
                                marginBelow: "NONE"
                              ),
                              width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(text: { "– or –" }, size: "MEDIUM")
                                }
                              ),
                              width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                              item: a!buttonArrayLayout(
                                buttons: {
                                  a!buttonWidget(
                                    label: "Save for Later",
                                    value: true,
                                    saveInto: local!showSaveForLater,
                                    size: "LARGE",
                                    style: "OUTLINE"
                                  )
                                },
                                align: "START",
                                marginBelow: "NONE"
                              ),
                              width: "MINIMIZE"
                            )
                          },
                          alignVertical: "MIDDLE",
                          showWhen: not(local!showSaveForLater)
                        ),
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: {
                                      a!richTextItem(text: { "$113.50" }, style: { "STRONG" }),
                                      " "
                                    },
                                    size: "LARGE"
                                  ),
                                  a!richTextItem(text: { "/ Month" }, size: "MEDIUM")
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!textField(
                                label: "Your email address",
                                labelPosition: "COLLAPSED",
                                placeholder: "Your email address",
                                saveInto: {},
                                refreshAfter: "UNFOCUS",
                                validations: {}
                              )
                            ),
                            a!sideBySideItem(
                              item: a!buttonArrayLayout(
                                buttons: {
                                  a!buttonWidget(
                                    label: "Send Quote",
                                    icon: "envelope-o",
                                    size: "LARGE",
                                    style: "OUTLINE"
                                  )
                                },
                                align: "START",
                                marginBelow: "NONE"
                              ),
                              width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                helpTooltip: "",
                                value: {
                                  a!richTextIcon(
                                    icon: "times-circle",
                                    link: a!dynamicLink(
                                      value: false,
                                      saveInto: local!showSaveForLater
                                    ),
                                    linkStyle: "STANDALONE"
                                  )
                                },
                                tooltip: "Cancel"
                              ),
                              width: "MINIMIZE"
                            )
                          },
                          alignVertical: "MIDDLE",
                          showWhen: local!showSaveForLater
                        )
                      },
                      height: "AUTO",
                      style: "NONE",
                      padding: "STANDARD",
                      marginBelow: "STANDARD",
                      showBorder: true,
                      showShadow: false,
                      decorativeBarPosition: "TOP",
                      decorativeBarColor: "ACCENT"
                    ),
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextItem(text: { "Auto Insurance" }, size: "MEDIUM")
                      }
                    ),
                    a!cardLayout(
                      contents: {
                        a!sectionLayout(
                          label: "",
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "hand-holding-usd",
                                        size: "MEDIUM_PLUS"
                                      )
                                    }
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(text: { "3 discounts" }, size: "MEDIUM")
                                    }
                                  ),
                                  width: "AUTO"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "$42.90/mo" },
                                        color: "#38761d",
                                        size: "MEDIUM",
                                        style: { "STRONG" }
                                      )
                                    }
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          a!richTextIcon(icon: "angle-right-bold")
                                        },
                                        color: "STANDARD",
                                        size: "MEDIUM",
                                        style: { "STRONG" }
                                      )
                                    }
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "MIDDLE"
                            )
                          },
                          marginBelow: "NONE"
                        )
                      },
                      link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                      height: "AUTO",
                      style: "NONE",
                      marginBelow: "STANDARD"
                    ),
                    a!cardLayout(
                      contents: {
                        a!sectionLayout(
                          label: "",
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(icon: "car", size: "MEDIUM_PLUS")
                                    }
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(text: { "1 vehicle" }, size: "MEDIUM")
                                    }
                                  ),
                                  width: "AUTO"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          a!richTextIcon(icon: "angle-right-bold")
                                        },
                                        color: "STANDARD",
                                        size: "MEDIUM",
                                        style: { "STRONG" }
                                      )
                                    }
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "MIDDLE"
                            )
                          },
                          marginBelow: "NONE"
                        )
                      },
                      link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                      height: "AUTO",
                      style: "NONE",
                      marginBelow: "STANDARD"
                    ),
                    a!cardLayout(
                      contents: {
                        a!sectionLayout(
                          label: "",
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(icon: "user-friends", size: "MEDIUM_PLUS")
                                    }
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(text: { "1 driver" }, size: "MEDIUM")
                                    }
                                  ),
                                  width: "AUTO"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          a!richTextIcon(icon: "angle-right-bold")
                                        },
                                        color: "STANDARD",
                                        size: "MEDIUM",
                                        style: { "STRONG" }
                                      )
                                    }
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "MIDDLE"
                            )
                          },
                          marginBelow: "NONE"
                        )
                      },
                      link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                      height: "AUTO",
                      style: "NONE",
                      marginBelow: "STANDARD"
                    ),
                    a!cardLayout(
                      contents: {
                        a!sectionLayout(
                          label: "",
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(icon: "umbrella", size: "MEDIUM_PLUS")
                                    }
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(text: { "Coverage" }, size: "MEDIUM")
                                    }
                                  ),
                                  width: "AUTO"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { a!richTextIcon(icon: "angle-down-bold") },
                                        color: "STANDARD",
                                        size: "MEDIUM",
                                        style: { "STRONG" }
                                      )
                                    }
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "MIDDLE"
                            )
                          },
                          divider: "NONE",
                          marginBelow: "NONE"
                        )
                      },
                      link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                      height: "AUTO",
                      style: "NONE",
                      marginBelow: "NONE",
                      showShadow: false
                    ),
                    a!cardLayout(
                      contents: {
                        a!sectionLayout(
                          label: "",
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "Bodily Injury Liability" },
                                        style: { "STRONG" }
                                      ),
                                      char(10),
                                      "$50,000/person",
                                      char(10),
                                      "$100,000/accident"
                                    }
                                  )
                                ),
                                a!sideBySideItem(
                                  item: a!buttonArrayLayout(
                                    buttons: {
                                      a!buttonWidget(label: "Edit", style: "OUTLINE", color: "SECONDARY")
                                    },
                                    align: "START",
                                    marginBelow: "NONE"
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "TOP"
                            )
                          },
                          divider: "BELOW"
                        ),
                        a!sectionLayout(
                          label: "",
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: {
                                          "Uninsured/Underinsured Motorist Bodily Injury Liability"
                                        },
                                        style: { "STRONG" }
                                      ),
                                      char(10),
                                      "$50,000/person",
                                      char(10),
                                      "$100,000/accident"
                                    }
                                  )
                                ),
                                a!sideBySideItem(
                                  item: a!buttonArrayLayout(
                                    buttons: {
                                      a!buttonWidget(label: "Edit", style: "OUTLINE", color: "SECONDARY")
                                    },
                                    align: "START",
                                    marginBelow: "NONE"
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "TOP"
                            )
                          },
                          divider: "BELOW"
                        ),
                        a!sectionLayout(
                          label: "",
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "Property Damage Liability" },
                                        style: { "STRONG" }
                                      ),
                                      char(10),
                                      "$75,000/accident"
                                    }
                                  )
                                ),
                                a!sideBySideItem(
                                  item: a!buttonArrayLayout(
                                    buttons: {
                                      a!buttonWidget(label: "Edit", style: "OUTLINE", color: "SECONDARY")
                                    },
                                    align: "START",
                                    marginBelow: "NONE"
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "TOP"
                            )
                          },
                          divider: "BELOW"
                        ),
                        a!sectionLayout(
                          label: "",
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "Medical Payments" },
                                        style: { "STRONG" }
                                      ),
                                      char(10),
                                      "$25,000/person",
                                      char(10),
                                      "$50,000/accident"
                                    }
                                  )
                                ),
                                a!sideBySideItem(
                                  item: a!buttonArrayLayout(
                                    buttons: {
                                      a!buttonWidget(label: "Edit", style: "OUTLINE", color: "SECONDARY")
                                    },
                                    align: "START",
                                    marginBelow: "NONE"
                                  ),
                                  width: "MINIMIZE"
                                )
                              },
                              alignVertical: "TOP"
                            )
                          },
                          divider: "NONE"
                        )
                      },
                      height: "AUTO",
                      style: "NONE",
                      marginBelow: "STANDARD"
                    )
                  },
                  width: "WIDE"
                ),
                a!columnLayout(contents: {})
              },
              marginAbove: "EVEN_MORE",
              marginBelow: "EVEN_MORE",
              stackWhen: {
                "PHONE",
                "TABLET_PORTRAIT",
                "TABLET_LANDSCAPE",
                "DESKTOP_NARROW"
              }
            ),
            a!cardLayout(
              contents: {},
              height: "SHORT_PLUS",
              style: "NONE",
              marginBelow: "STANDARD",
              showBorder: false
            )
          },
          height: "AUTO",
          style: "NONE",
          marginBelow: "NONE",
          showBorder: false
        ),
        a!cardLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!imageField(
                      label: "",
                      labelPosition: "COLLAPSED",
                      /* This is a placeholder image; replace as needed */
                      images: {
                        a!documentImage(
                          document: a!EXAMPLE_DOCUMENT_IMAGE()
                        )
                      },
                      size: "MEDIUM",
                      isThumbnail: false,
                      style: "STANDARD"
                    )
                  },
                  width: "MEDIUM"
                ),
                a!columnLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        "We may use information from public sources or third parties, such as driving records, claim history, vehicle driving data, and credit reports to provide you with the best quote.",
                        char(10),
                        char(10),
                        "Some discounts, coverages, payment plans, and features are not available in all states.",
                        char(10),
                        char(10),
                        "This site exists for demonstration purposes only. We can't actually sell you auto insurance."
                      }
                    )
                  }
                )
              },
              stackWhen: { "PHONE", "TABLET_PORTRAIT" }
            )
          },
          height: "TALL",
          style: "#333",
          padding: "EVEN_MORE",
          marginBelow: "STANDARD",
          showBorder: false,
          decorativeBarPosition: "NONE",
          decorativeBarColor: "#056CF2"
        )
      },
      contents: {},
      backgroundColor: "#333",
      contentsPadding: "NONE"
    )
  )
)
