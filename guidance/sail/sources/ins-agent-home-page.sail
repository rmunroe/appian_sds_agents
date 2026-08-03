a!localVariables(
  local!dayHeight: "SHORT",
  a!headerContentLayout(
    header: {},
    contents: {
      /*  Good morning message  */
      a!sideBySideLayout(
        items: {
          a!sideBySideItem(
            item: a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextIcon(
                  icon: "sun",
                  color: "#ee7955",
                  size: "LARGE"
                )
              }
            ),
            width: "MINIMIZE"
          ),
          a!sideBySideItem(
            width:"MINIMIZE",
            item: a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: { "Good morning, Denise" },
                  color: "#54514e",
                  size: "LARGE",
                  style: { "STRONG" }
                )
              }
            )
          ),
          a!sideBySideItem(
            item: a!imageField(
              label: "",
              labelPosition: "COLLAPSED",
              images: {
                /*Insert image here*/
              },
              showWhen: if(
                a!isPageWidth(
                  {
                    "PHONE",
                    "TABLET_PORTRAIT",
                    "TABLET_LANDSCAPE",
                    "DESKTOP_NARROW"
                  }
                ),
                false,
                true
              ),
              size: "EXTRA_LARGE",
              isThumbnail: false,
              style: "STANDARD",
              align: "CENTER"
            )
          ),
          a!sideBySideItem(
            item: a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: { "Wednesday, November 15" },
                  size: "MEDIUM"
                )
              }
            ),
            width: "MINIMIZE",
            showWhen: if(
              a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" }),
              false,
              true
            )
          )
        },
        alignVertical: "MIDDLE",
        spacing: if(
          a!isPageWidth("PHONE"),
          "SPARSE",
          "STANDARD"
        ),
        marginBelow: "EVEN_MORE"
      ),
      a!columnsLayout(
        columns: {
          /*Extra spacing for two column layout on landscape tablet and narrow desktop*/
          a!columnLayout(
            width: if(
              a!isPageWidth("DESKTOP_WIDE"),
              null,
              "1X"
            ),
            contents: {},
            showWhen: a!isPageWidth({ "TABLET_LANDSCAPE", "DESKTOP_NARROW",  })
          ),
          a!columnLayout(
            contents: {
              /*    My Tasks    */
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
                              text: { "My Tasks" },
                              color: "#54514e",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            )
                          }
                        )
                      ),
                      a!sideBySideItem(
                        item: a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { "View all tasks" },
                              link: a!dynamicLink(),
                              linkStyle: "STANDALONE",
                              size: "STANDARD"
                            )
                          }
                        ),
                        width: "MINIMIZE"
                      )
                    },
                    alignVertical: "MIDDLE"
                  ),
                  a!cardLayout(
                    contents: {
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: { "Review new claim for Park, K." },
                            style: { "STRONG" }
                          )
                        }
                      ),
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              text: "DS",
                              backgroundColor: "#D19FCB",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Assigned to you" },
                                  color: "#666666",
                                  size: "SMALL"
                                )
                              }
                            )
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextIcon(
                                  icon: "ellipsis-v",
                                  link: a!dynamicLink(),
                                  linkStyle: "STANDALONE"
                                )
                              }
                            ),
                            width: "MINIMIZE"
                          )
                        },
                        alignVertical: "MIDDLE",
                        spacing: "DENSE"
                      ),
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: {
                                    a!richTextIcon(icon: "clock-o"),
                                    " Yesterday at 5:00PM"
                                  },
                                  color: "#666666",
                                  size: "SMALL"
                                )
                              }
                            )
                          ),
                          a!sideBySideItem(
                            item: a!tagField(
                              labelPosition: "COLLAPSED",
                              tags: {
                                a!tagItem(
                                  text: "OVERDUE",
                                  backgroundColor: "NEGATIVE"
                                )
                              },
                              size: "SMALL"
                            ),
                            width: "MINIMIZE"
                          )
                        },
                        alignVertical: "MIDDLE"
                      )
                    },
                    link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    padding: "STANDARD",
                    marginBelow: "STANDARD",
                    showBorder: false,
                    showShadow: true
                  ),
                  a!cardLayout(
                    contents: {
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: {
                              "Generate renewal quote for Mendez, S."
                            },
                            style: { "STRONG" }
                          )
                        }
                      ),
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              text: "DS",
                              backgroundColor: "#D19FCB",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Assigned to you" },
                                  color: "#666666",
                                  size: "SMALL"
                                )
                              }
                            )
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextIcon(
                                  icon: "ellipsis-v",
                                  link: a!dynamicLink(),
                                  linkStyle: "STANDALONE"
                                )
                              }
                            ),
                            width: "MINIMIZE"
                          )
                        },
                        alignVertical: "MIDDLE",
                        spacing: "DENSE"
                      ),
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: {
                              a!richTextIcon(icon: "clock-o"),
                              " Today at 5:00PM"
                            },
                            color: "#666666",
                            size: "SMALL"
                          )
                        }
                      )
                    },
                    link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    padding: "STANDARD",
                    marginBelow: "STANDARD",
                    showBorder: false,
                    showShadow: true
                  ),
                  a!cardLayout(
                    contents: {
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: { "Respond to new customer inquiry" },
                            style: { "STRONG" }
                          )
                        }
                      ),
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              text: "DS",
                              backgroundColor: "#D19FCB",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              text: "YK",
                              backgroundColor: "#79B096",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              text: "+3",
                              backgroundColor: "#ccc",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Assigned to WeHo Office" },
                                  color: "#666666",
                                  size: "SMALL"
                                )
                              }
                            )
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextIcon(
                                  icon: "ellipsis-v",
                                  link: a!dynamicLink(),
                                  linkStyle: "STANDALONE"
                                )
                              }
                            ),
                            width: "MINIMIZE"
                          )
                        },
                        alignVertical: "MIDDLE",
                        spacing: "DENSE"
                      ),
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: {
                              a!richTextIcon(icon: "clock-o"),
                              " Tomorrow at 12:00PM"
                            },
                            color: "#666666",
                            size: "SMALL"
                          )
                        }
                      )
                    },
                    link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    padding: "STANDARD",
                    marginBelow: "STANDARD",
                    showBorder: false,
                    showShadow: true
                  ),
                  a!cardLayout(
                    contents: {
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: {
                              "Update contact information for McAllister, S."
                            },
                            style: { "STRONG" }
                          )
                        }
                      ),
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              text: "DS",
                              backgroundColor: "#D19FCB",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Assigned to you" },
                                  color: "#666666",
                                  size: "SMALL"
                                )
                              }
                            )
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextIcon(
                                  icon: "ellipsis-v",
                                  link: a!dynamicLink(),
                                  linkStyle: "STANDALONE"
                                )
                              }
                            ),
                            width: "MINIMIZE"
                          )
                        },
                        alignVertical: "MIDDLE",
                        spacing: "DENSE"
                      ),
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: {
                              a!richTextIcon(icon: "clock-o"),
                              " Friday at 5:00PM"
                            },
                            color: "#666666",
                            size: "SMALL"
                          )
                        }
                      )
                    },
                    link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    padding: "STANDARD",
                    marginBelow: "STANDARD",
                    showBorder: false,
                    showShadow: true
                  ),
                  a!cardLayout(
                    contents: {
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: { "Submit holiday greeting card list" },
                            style: { "STRONG" }
                          )
                        }
                      ),
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              text: "DS",
                              backgroundColor: "#D19FCB",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Assigned to you" },
                                  color: "#666666",
                                  size: "SMALL"
                                )
                              }
                            )
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextIcon(
                                  icon: "ellipsis-v",
                                  link: a!dynamicLink(),
                                  linkStyle: "STANDALONE"
                                )
                              }
                            ),
                            width: "MINIMIZE"
                          )
                        },
                        alignVertical: "MIDDLE",
                        spacing: "DENSE"
                      ),
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: {
                              a!richTextIcon(icon: "clock-o"),
                              " Friday at 5:00PM"
                            },
                            color: "#666666",
                            size: "SMALL"
                          )
                        }
                      )
                    },
                    link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    padding: "STANDARD",
                    marginBelow: "STANDARD",
                    showBorder: false,
                    showShadow: true
                  )
                }
              ),
              
            },
            width: if(
              a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP" }),
              "MEDIUM",
              "4X"
            ),
            
          ),
          a!columnLayout(
            contents: {
              /* Calendar on large and small screen sizes */
              a!localVariables(
                local!headerPadding: if(
                  a!isPageWidth({ "DESKTOP_WIDE" }),
                  "STANDARD",
                  "EVEN_LESS"
                ),
                a!sectionLayout(
                  contents: {
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: { "Calendar" },
                                color: "#54514e",
                                size: "MEDIUM_PLUS",
                                style: { "STRONG" }
                              )
                            }
                          )
                        ),
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: { "Go to full calendar" },
                                color: "ACCENT",
                                size: "STANDARD"
                              )
                            }
                          ),
                          width: "MINIMIZE"
                        )
                      },
                      alignVertical: "MIDDLE"
                    ),
                    a!cardLayout(
                      contents: {
                        a!cardLayout(
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "chevron-left",
                                        link: a!dynamicLink(),
                                        linkStyle: "STANDALONE"
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
                                        text: { "November 2023" },
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
                                      a!richTextIcon(
                                        icon: "chevron-right",
                                        link: a!dynamicLink(),
                                        linkStyle: "STANDALONE"
                                      )
                                    }
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  width: if(
                                    a!isPageWidth("DESKTOP_WIDE"),
                                    "2X",
                                    "1X"
                                  )
                                ),
                                a!sideBySideItem(
                                  showWhen: not(a!isPageWidth({ "PHONE" })),
                                  item: a!dropdownField(
                                    choiceLabels: { "Day", "Week", "Month" },
                                    choiceValues: { 1, 2, 3 },
                                    label: "Calendar View",
                                    labelPosition: "COLLAPSED",
                                    placeholder: "--- Select a Value ---",
                                    value: 3,
                                    saveInto: {},
                                    searchDisplay: "AUTO",
                                    validations: {}
                                  )
                                )
                              },
                              alignVertical: "MIDDLE"
                            )
                          },
                          height: "AUTO",
                          style: "TRANSPARENT",
                          padding: "STANDARD",
                          marginBelow: "NONE",
                          showBorder: false
                        ),
                        a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                        if(
                          a!isPageWidth("PHONE"),
                          /*   Calendar formatting for phone device widths */
                          {
                            a!cardLayout(
                              contents: {
                                a!columnsLayout(
                                  stackWhen: "NEVER",
                                  columns: {
                                    a!columnLayout(
                                      width: "EXTRA_NARROW",
                                      contents: a!cardLayout(
                                        padding: "NONE",
                                        marginAbove: "NONE",
                                        marginBelow: "NONE",
                                        shape: "SEMI_ROUNDED",
                                        showBorder: false,
                                        contents: {
                                          a!cardLayout(
                                            padding: "EVEN_LESS",
                                            showBorder: false,
                                            style: "#f7f7f7",
                                            contents: {
                                              a!richTextDisplayField(
                                                align: "CENTER",
                                                labelPosition: "COLLAPSED",
                                                value: a!richTextItem(
                                                  text: "14",
                                                  color: "#555555",
                                                  size: "MEDIUM_PLUS"
                                                )
                                              )
                                            }
                                          ),
                                          a!cardLayout(
                                            showBorder: false,
                                            padding: "NONE",
                                            style: "#efefef",
                                            contents: {
                                              a!richTextDisplayField(
                                                marginBelow: "NONE",
                                                align: "CENTER",
                                                labelPosition: "COLLAPSED",
                                                value: a!richTextItem(text: "THU", size: "SMALL", style: "STRONG")
                                              )
                                            }
                                          )
                                        }
                                      )
                                    ),
                                    a!columnLayout(
                                      contents: a!richTextDisplayField(
                                        value: {
                                          a!richTextIcon(
                                            icon: "exclamation-triangle",
                                            color: "NEGATIVE",
                                            size: "STANDARD"
                                          ),
                                          a!richTextItem(
                                            text: { " Review new claim for Park, K." },
                                            size: "STANDARD"
                                          )
                                        }
                                      )
                                    )
                                  },
                                  alignVertical: "TOP"
                                ),
                                a!columnsLayout(
                                  stackWhen: "NEVER",
                                  columns: {
                                    a!columnLayout(
                                      width: "EXTRA_NARROW",
                                      contents: a!cardLayout(
                                        padding: "NONE",
                                        marginAbove: "NONE",
                                        marginBelow: "NONE",
                                        shape: "SEMI_ROUNDED",
                                        showBorder: false,
                                        contents: {
                                          a!cardLayout(
                                            padding: "EVEN_LESS",
                                            showBorder: false,
                                            style: "#f7f7f7",
                                            contents: {
                                              a!richTextDisplayField(
                                                align: "CENTER",
                                                labelPosition: "COLLAPSED",
                                                value: a!richTextItem(
                                                  text: "15",
                                                  color: "#555555",
                                                  size: "MEDIUM_PLUS"
                                                )
                                              )
                                            }
                                          ),
                                          a!cardLayout(
                                            showBorder: false,
                                            padding: "NONE",
                                            style: "#efefef",
                                            contents: {
                                              a!richTextDisplayField(
                                                marginBelow: "NONE",
                                                align: "CENTER",
                                                labelPosition: "COLLAPSED",
                                                value: a!richTextItem(text: "FRI", size: "SMALL", style: "STRONG")
                                              )
                                            }
                                          )
                                        }
                                      )
                                    ),
                                    a!columnLayout(
                                      contents: a!richTextDisplayField(
                                        preventWrapping: true,
                                        value: {
                                          a!richTextIcon(
                                            icon: "circle",
                                            color: "#6d9eeb",
                                            size: "STANDARD"
                                          ),
                                          a!richTextItem(
                                            text: {
                                              " Generate renewal quote for Mendez, S."
                                            },
                                            size: "STANDARD"
                                          )
                                        }
                                      )
                                    )
                                  },
                                  alignVertical: "TOP"
                                ),
                                a!columnsLayout(
                                  stackWhen: "NEVER",
                                  columns: {
                                    a!columnLayout(
                                      width: "EXTRA_NARROW",
                                      contents: a!cardLayout(
                                        padding: "NONE",
                                        marginAbove: "NONE",
                                        marginBelow: "NONE",
                                        shape: "SEMI_ROUNDED",
                                        showBorder: false,
                                        contents: {
                                          a!cardLayout(
                                            padding: "EVEN_LESS",
                                            showBorder: false,
                                            style: "#f7f7f7",
                                            contents: {
                                              a!richTextDisplayField(
                                                align: "CENTER",
                                                labelPosition: "COLLAPSED",
                                                value: a!richTextItem(
                                                  text: "16",
                                                  color: "#555555",
                                                  size: "MEDIUM_PLUS"
                                                )
                                              )
                                            }
                                          ),
                                          a!cardLayout(
                                            showBorder: false,
                                            padding: "NONE",
                                            style: "#efefef",
                                            contents: {
                                              a!richTextDisplayField(
                                                marginBelow: "NONE",
                                                align: "CENTER",
                                                labelPosition: "COLLAPSED",
                                                value: a!richTextItem(text: "SAT", size: "SMALL", style: "STRONG")
                                              )
                                            }
                                          )
                                        }
                                      )
                                    ),
                                    a!columnLayout(
                                      contents: a!richTextDisplayField(
                                        value: {
                                          a!richTextIcon(
                                            icon: "square",
                                            color: "#93c47d",
                                            size: "STANDARD"
                                          ),
                                          a!richTextItem(
                                            text: { " Respond to new customer query" },
                                            size: "STANDARD"
                                          )
                                        }
                                      )
                                    )
                                  },
                                  alignVertical: "TOP"
                                ),
                                a!columnsLayout(
                                  stackWhen: "NEVER",
                                  columns: {
                                    a!columnLayout(
                                      width: "EXTRA_NARROW",
                                      contents: a!cardLayout(
                                        padding: "NONE",
                                        marginAbove: "NONE",
                                        marginBelow: "NONE",
                                        shape: "SEMI_ROUNDED",
                                        showBorder: false,
                                        contents: {
                                          a!cardLayout(
                                            padding: "EVEN_LESS",
                                            showBorder: false,
                                            style: "#f7f7f7",
                                            contents: {
                                              a!richTextDisplayField(
                                                align: "CENTER",
                                                labelPosition: "COLLAPSED",
                                                value: a!richTextItem(
                                                  text: "17",
                                                  color: "#555555",
                                                  size: "MEDIUM_PLUS"
                                                )
                                              )
                                            }
                                          ),
                                          a!cardLayout(
                                            showBorder: false,
                                            padding: "NONE",
                                            style: "#efefef",
                                            contents: {
                                              a!richTextDisplayField(
                                                marginBelow: "NONE",
                                                align: "CENTER",
                                                labelPosition: "COLLAPSED",
                                                value: a!richTextItem(text: "SUN", size: "SMALL", style: "STRONG")
                                              )
                                            }
                                          )
                                        }
                                      )
                                    ),
                                    a!columnLayout(
                                      contents: a!richTextDisplayField(
                                        value: {
                                          a!richTextIcon(
                                            icon: "circle",
                                            color: "#6d9eeb",
                                            size: "STANDARD"
                                          ),
                                          a!richTextItem(
                                            text: { " Update contact information" },
                                            size: "STANDARD"
                                          ),
                                          char(10),
                                          a!richTextIcon(
                                            icon: "circle",
                                            color: "#6d9eeb",
                                            size: "STANDARD"
                                          ),
                                          a!richTextItem(
                                            text: { " Submit holiday card list" },
                                            size: "STANDARD"
                                          )
                                        },
                                        preventWrapping: false
                                      )
                                    )
                                  },
                                  alignVertical: "TOP"
                                )
                              },
                              height: "AUTO",
                              style: "TRANSPARENT",
                              padding: "STANDARD",
                              marginAbove: "LESS",
                              marginBelow: "STANDARD",
                              showBorder: false
                            )
                          },
                          /*   Calendar formatting for non-phone device widths */
                          {
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: { "SUN" },
                                          preventWrapping: true,
                                          align: "CENTER"
                                        )
                                      },
                                      height: "AUTO",
                                      style: "#f3f3f3",
                                      padding: local!headerPadding,
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: { "MON" },
                                          preventWrapping: true,
                                          align: "CENTER"
                                        )
                                      },
                                      height: "AUTO",
                                      style: "#f3f3f3",
                                      padding: local!headerPadding,
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: { "TUE" },
                                          preventWrapping: true,
                                          align: "CENTER"
                                        )
                                      },
                                      height: "AUTO",
                                      style: "#f3f3f3",
                                      padding: local!headerPadding,
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: { "WED" },
                                          preventWrapping: true,
                                          align: "CENTER"
                                        )
                                      },
                                      height: "AUTO",
                                      style: "#f3f3f3",
                                      padding: local!headerPadding,
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: { "THU" },
                                          preventWrapping: true,
                                          align: "CENTER"
                                        )
                                      },
                                      height: "AUTO",
                                      style: "#f3f3f3",
                                      padding: local!headerPadding,
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: { "FRI" },
                                          preventWrapping: true,
                                          align: "CENTER"
                                        )
                                      },
                                      height: "AUTO",
                                      style: "#f3f3f3",
                                      padding: local!headerPadding,
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: { "SAT" },
                                          preventWrapping: true,
                                          align: "CENTER"
                                        )
                                      },
                                      height: "AUTO",
                                      style: "#f3f3f3",
                                      padding: local!headerPadding,
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                )
                              },
                              marginBelow: "NONE",
                              spacing: "NONE",
                              showDividers: true
                            ),
                            a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "29" },
                                                    color: "SECONDARY",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "30" },
                                                    color: "SECONDARY",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "31" },
                                                    color: "SECONDARY",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "1" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "2" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "3" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "4" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                )
                              },
                              marginBelow: "NONE",
                              spacing: "NONE",
                              showDividers: true
                            ),
                            a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "5" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "6" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "7" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "8" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "9" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "10" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "11" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                )
                              },
                              marginBelow: "NONE",
                              spacing: "NONE",
                              showDividers: true
                            ),
                            a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "12" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "13" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "14" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        ),
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextIcon(
                                              icon: "exclamation-triangle",
                                              color: "NEGATIVE",
                                              size: "SMALL"
                                            ),
                                            a!richTextItem(
                                              text: { " Review new claim for Park, K." },
                                              size: "SMALL"
                                            )
                                          },
                                          preventWrapping: true,
                                          marginBelow: "EVEN_LESS"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "15" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM",
                                                    style: { "STRONG" }
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        ),
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextIcon(
                                              icon: "circle",
                                              color: "#6d9eeb",
                                              size: "SMALL"
                                            ),
                                            a!richTextItem(
                                              text: {
                                                " Generate renewal quote for Mendez, S."
                                              },
                                              size: "SMALL"
                                            )
                                          },
                                          preventWrapping: true,
                                          marginBelow: "EVEN_LESS"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "16" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        ),
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextIcon(
                                              icon: "square",
                                              color: "#93c47d",
                                              size: "SMALL"
                                            ),
                                            a!richTextItem(
                                              text: { " Respond to new customer query" },
                                              size: "SMALL"
                                            )
                                          },
                                          preventWrapping: true,
                                          marginBelow: "EVEN_LESS"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "17" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        ),
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextIcon(
                                              icon: "circle",
                                              color: "#6d9eeb",
                                              size: "SMALL"
                                            ),
                                            a!richTextItem(
                                              text: { " Update contact information" },
                                              size: "SMALL"
                                            )
                                          },
                                          preventWrapping: true,
                                          marginBelow: "EVEN_LESS"
                                        ),
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextIcon(
                                              icon: "circle",
                                              color: "#6d9eeb",
                                              size: "SMALL"
                                            ),
                                            a!richTextItem(
                                              text: { " Submit holiday card list" },
                                              size: "SMALL"
                                            )
                                          },
                                          preventWrapping: true,
                                          marginBelow: "EVEN_LESS"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "18" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                )
                              },
                              marginBelow: "NONE",
                              spacing: "NONE",
                              showDividers: true
                            ),
                            a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "19" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "20" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "21" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "22" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "23" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "24" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "25" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                )
                              },
                              marginBelow: "NONE",
                              spacing: "NONE",
                              showDividers: true
                            ),
                            a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                            a!columnsLayout(
                              columns: {
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "26" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "27" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "28" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "29" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "30" },
                                                    color: "STANDARD",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "1" },
                                                    color: "SECONDARY",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!cardLayout(
                                      contents: {
                                        a!sideBySideLayout(
                                          items: {
                                            a!sideBySideItem(
                                              item: a!richTextDisplayField(
                                                labelPosition: "COLLAPSED",
                                                value: {
                                                  a!richTextItem(
                                                    text: { "2" },
                                                    color: "SECONDARY",
                                                    size: "MEDIUM"
                                                  )
                                                },
                                                align: "RIGHT"
                                              )
                                            )
                                          },
                                          alignVertical: "MIDDLE"
                                        )
                                      },
                                      height: local!dayHeight,
                                      style: "TRANSPARENT",
                                      marginBelow: "NONE",
                                      showBorder: false
                                    )
                                  }
                                )
                              },
                              marginBelow: "NONE",
                              spacing: "NONE",
                              showDividers: true
                            )
                          }
                        )
                      },
                      height: "AUTO",
                      style: "NONE",
                      shape: "ROUNDED",
                      padding: "NONE",
                      marginBelow: "NONE",
                      showBorder: false,
                      showShadow: true
                    )
                  },
                  showWhen: if(
                    a!isPageWidth(
                      {
                        "DESKTOP",
                        "DESKTOP_WIDE",
                        "TABLET_PORTRAIT",
                        "PHONE"
                      }
                    ),
                    true,
                    false
                  )
                )
              )
            },
            showWhen: a!isPageWidth(
              {
                "DESKTOP_WIDE",
                "DESKTOP",
                "TABLET_PORTRAIT",
                "PHONE"
              }
            ),
            
          ),
          a!columnLayout(
            contents: {
              /*  Actions */
              a!sectionLayout(
                label: "",
                labelHeadingTag: "H2",
                labelColor: "#54514e",
                contents: {
                  a!sideBySideLayout(
                    items: {
                      a!sideBySideItem(
                        item: a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { "Actions" },
                              color: "#54514e",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            )
                          }
                        )
                      ),
                      a!sideBySideItem(
                        item: a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { "Manage" },
                              color: "ACCENT",
                              size: "STANDARD"
                            )
                          }
                        ),
                        width: "MINIMIZE"
                      )
                    },
                    alignVertical: "MIDDLE"
                  ),
                  a!cardLayout(
                    contents: {
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              icon: "user-plus",
                              backgroundColor: "#de8cb7",
                              contentColor: "#ffffff",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: { "New Client" }
                            )
                          )
                        },
                        alignVertical: "MIDDLE"
                      )
                    },
                    link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    marginBelow: "STANDARD",
                    showBorder: false,
                    showShadow: true
                  ),
                  a!cardLayout(
                    contents: {
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              icon: "file-invoice-dollar",
                              backgroundColor: "#b094da",
                              contentColor: "#ffffff",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: { "New Claim" }
                            )
                          )
                        },
                        alignVertical: "MIDDLE"
                      )
                    },
                    link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    marginBelow: "STANDARD",
                    showBorder: false,
                    showShadow: true
                  ),
                  a!cardLayout(
                    contents: {
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              icon: "comment-dollar",
                              backgroundColor: "#6fbb62",
                              contentColor: "#ffffff",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: { "New Quote" }
                            )
                          )
                        },
                        alignVertical: "MIDDLE"
                      )
                    },
                    link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    marginBelow: "STANDARD",
                    showBorder: false,
                    showShadow: true
                  )
                }
              ),
              /*  Conversations */
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
                              text: { "Conversations" },
                              color: "#54514e",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            )
                          }
                        )
                      ),
                      a!sideBySideItem(
                        item: a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { "View all threads" },
                              color: "ACCENT",
                              size: "STANDARD"
                            )
                          }
                        ),
                        width: "MINIMIZE"
                      )
                    },
                    alignVertical: "MIDDLE"
                  ),
                  a!cardLayout(
                    contents: {
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              text: "JK",
                              backgroundColor: "#eccd5f",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Jane Kim" },
                                  size: "STANDARD",
                                  style: { "STRONG" }
                                ),
                                a!richTextItem(
                                  text: { " • A moment ago" },
                                  color: "SECONDARY",
                                  size: "SMALL"
                                )
                              }
                            ),
                            width: "AUTO"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextIcon(icon: "reply", color: "ACCENT")
                              }
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextIcon(icon: "ellipsis-v", color: "ACCENT")
                              }
                            ),
                            width: "MINIMIZE"
                          )
                        },
                        alignVertical: "MIDDLE"
                      ),
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(text: "@Denise Simmons", color: "ACCENT"),
                          " we received the police report from the insured party, so you can go ahead and reclassify this as an uninsured motorist claim."
                        }
                      ),
                      a!cardLayout(
                        contents: {
                          a!columnsLayout(
                            columns: {
                              a!columnLayout(
                                contents: {
                                  a!cardLayout(
                                    contents: {
                                      a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(
                                            icon: "file-invoice-dollar",
                                            color: "#674ea7",
                                            size: "MEDIUM_PLUS"
                                          )
                                        },
                                        align: "CENTER",
                                        marginAbove: "EVEN_LESS",
                                        marginBelow: "EVEN_LESS"
                                      )
                                    },
                                    height: "AUTO",
                                    style: "#d9d2e9",
                                    marginBelow: "NONE",
                                    showBorder: false
                                  )
                                },
                                width: "EXTRA_NARROW"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!cardLayout(
                                    contents: {
                                      a!sideBySideLayout(
                                        items: {
                                          a!sideBySideItem(
                                            item: a!richTextDisplayField(
                                              labelPosition: "COLLAPSED",
                                              value: {
                                                a!richTextItem(
                                                  text: { "Claim #431-914-53" },
                                                  style: { "STRONG" }
                                                )
                                              },
                                              preventWrapping: true,
                                              marginBelow: "NONE"
                                            )
                                          ),
                                          a!sideBySideItem(
                                            item: a!tagField(
                                              labelPosition: "COLLAPSED",
                                              tags: {
                                                a!tagItem(text: "AUTO", backgroundColor: "#9db6d0")
                                              },
                                              size: "SMALL"
                                            ),
                                            width: "MINIMIZE"
                                          )
                                        },
                                        alignVertical: "MIDDLE",
                                        marginBelow: "NONE"
                                      ),
                                      a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(text: { "Nov 6, 2023" }, color: "SECONDARY")
                                        },
                                        preventWrapping: true,
                                        marginBelow: "NONE"
                                      )
                                    },
                                    height: "AUTO",
                                    style: "NONE",
                                    marginBelow: "NONE",
                                    showBorder: false
                                  )
                                }
                              )
                            },
                            alignVertical: "MIDDLE",
                            spacing: "NONE"
                          )
                        },
                        link: a!dynamicLink(),
                        height: "AUTO",
                        style: "NONE",
                        shape: "SEMI_ROUNDED",
                        padding: "NONE",
                        marginAbove: "LESS",
                        marginBelow: "NONE",
                        showBorder: true,
                        showShadow: false
                      )
                    },
                    link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    padding: "STANDARD",
                    marginBelow: "STANDARD",
                    showBorder: false,
                    showShadow: true
                  ),
                  a!cardLayout(
                    contents: {
                      a!sideBySideLayout(
                        items: {
                          a!sideBySideItem(
                            item: a!stampField(
                              labelPosition: "COLLAPSED",
                              text: "CB",
                              backgroundColor: "#9dd0aa",
                              size: "TINY"
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Colleen Brock" },
                                  size: "STANDARD",
                                  style: { "STRONG" }
                                ),
                                a!richTextItem(
                                  text: { " • 9:02AM" },
                                  color: "SECONDARY",
                                  size: "SMALL"
                                )
                              }
                            ),
                            width: "AUTO"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextIcon(icon: "reply", color: "ACCENT")
                              }
                            ),
                            width: "MINIMIZE"
                          ),
                          a!sideBySideItem(
                            item: a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextIcon(icon: "ellipsis-v", color: "ACCENT")
                              }
                            ),
                            width: "MINIMIZE"
                          )
                        },
                        alignVertical: "MIDDLE"
                      ),
                      a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(text: "@Denise Simmons", color: "ACCENT"),
                          " yes, this one is going to be tricky because of prior claims. You may want to warn the customer that their premium will likely increase if they want us to cover this incident."
                        }
                      ),
                      a!cardLayout(
                        contents: {
                          a!columnsLayout(
                            columns: {
                              a!columnLayout(
                                contents: {
                                  a!cardLayout(
                                    contents: {
                                      a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextIcon(
                                            icon: "file-invoice-dollar",
                                            color: "#674ea7",
                                            size: "MEDIUM_PLUS"
                                          )
                                        },
                                        align: "CENTER",
                                        marginAbove: "EVEN_LESS",
                                        marginBelow: "EVEN_LESS"
                                      )
                                    },
                                    height: "AUTO",
                                    style: "#d9d2e9",
                                    marginBelow: "NONE",
                                    showBorder: false
                                  )
                                },
                                width: "EXTRA_NARROW"
                              ),
                              a!columnLayout(
                                contents: {
                                  a!cardLayout(
                                    contents: {
                                      a!sideBySideLayout(
                                        items: {
                                          a!sideBySideItem(
                                            item: a!richTextDisplayField(
                                              labelPosition: "COLLAPSED",
                                              value: {
                                                a!richTextItem(
                                                  text: { "Claim #431-858-29" },
                                                  style: { "STRONG" }
                                                )
                                              },
                                              preventWrapping: true,
                                              marginBelow: "NONE"
                                            )
                                          ),
                                          a!sideBySideItem(
                                            item: a!tagField(
                                              labelPosition: "COLLAPSED",
                                              tags: {
                                                a!tagItem(
                                                  text: "HOMEOWNER",
                                                  backgroundColor: "#9dd0ae"
                                                )
                                              },
                                              size: "SMALL"
                                            ),
                                            width: "MINIMIZE"
                                          )
                                        },
                                        alignVertical: "MIDDLE",
                                        marginBelow: "NONE"
                                      ),
                                      a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(text: { "Nov 1, 2023" }, color: "SECONDARY")
                                        },
                                        preventWrapping: true,
                                        marginBelow: "NONE"
                                      )
                                    },
                                    height: "AUTO",
                                    style: "NONE",
                                    marginBelow: "NONE",
                                    showBorder: false
                                  )
                                }
                              )
                            },
                            alignVertical: "MIDDLE",
                            spacing: "NONE"
                          )
                        },
                        link: a!dynamicLink(),
                        height: "AUTO",
                        style: "NONE",
                        shape: "SEMI_ROUNDED",
                        padding: "NONE",
                        marginAbove: "LESS",
                        marginBelow: "NONE",
                        showBorder: true,
                        showShadow: false
                      )
                    },
                    link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    padding: "STANDARD",
                    marginBelow: "STANDARD",
                    showBorder: false,
                    showShadow: true
                  )
                }
              )
            },
            width: if(
              a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP" }),
              "MEDIUM",
              "4X"
            ),
            
          ),
          a!columnLayout(
            width: if(
              a!isPageWidth({ "DESKTOP_WIDE", "DESKTOP" }),
              null,
              "1X"
            ),
            contents: {},
            showWhen: if(
              a!isPageWidth({ "TABLET_LANDSCAPE", "DESKTOP_NARROW",  }),
              true,
              false
            )
          )
        },
        spacing: "SPARSE",
        stackWhen: { "PHONE", "TABLET_PORTRAIT" }
      ),
      /*    Calendar  for medium screen sizes  */
      a!columnsLayout(
        spacing: "SPARSE",
        columns: {
          /*Extra spacing for two column layout on landscape tablet and narrow desktop*/
          a!columnLayout(
            width: "1X",
            contents: {},
            showWhen: a!isPageWidth({ "TABLET_LANDSCAPE", "DESKTOP_NARROW",  })
          ),
          a!columnLayout(
            width: "8X",
            contents: {
              /*  Calendar  */
              a!sectionLayout(
                contents: {
                  a!sideBySideLayout(
                    items: {
                      a!sideBySideItem(
                        item: a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { "Calendar" },
                              color: "#54514e",
                              size: "MEDIUM_PLUS",
                              style: { "STRONG" }
                            )
                          }
                        )
                      ),
                      a!sideBySideItem(
                        item: a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { "Go to full calendar" },
                              color: "ACCENT",
                              size: "STANDARD"
                            )
                          }
                        ),
                        width: "MINIMIZE"
                      )
                    },
                    alignVertical: "MIDDLE"
                  ),
                  a!cardLayout(
                    contents: {
                      a!cardLayout(
                        contents: {
                          a!sideBySideLayout(
                            items: {
                              a!sideBySideItem(
                                item: a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextIcon(
                                      icon: "chevron-left",
                                      link: a!dynamicLink(),
                                      linkStyle: "STANDALONE"
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
                                      text: { "November 2023" },
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
                                    a!richTextIcon(
                                      icon: "chevron-right",
                                      link: a!dynamicLink(),
                                      linkStyle: "STANDALONE"
                                    )
                                  }
                                ),
                                width: "MINIMIZE"
                              ),
                              a!sideBySideItem(width: "2X"),
                              a!sideBySideItem(
                                item: a!dropdownField(
                                  choiceLabels: { "Day", "Week", "Month" },
                                  choiceValues: { 1, 2, 3 },
                                  label: "Calendar View",
                                  labelPosition: "COLLAPSED",
                                  placeholder: "--- Select a Value ---",
                                  value: 3,
                                  saveInto: {},
                                  searchDisplay: "AUTO",
                                  validations: {}
                                )
                              )
                            },
                            alignVertical: "MIDDLE"
                          )
                        },
                        height: "AUTO",
                        style: "TRANSPARENT",
                        padding: "STANDARD",
                        marginBelow: "NONE",
                        showBorder: false
                      ),
                      a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                      a!columnsLayout(
                        columns: {
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "SUN" },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "#f3f3f3",
                                padding: "EVEN_LESS",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "MON" },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "#f3f3f3",
                                padding: "EVEN_LESS",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "TUE" },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "#f3f3f3",
                                padding: "EVEN_LESS",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "WED" },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "#f3f3f3",
                                padding: "EVEN_LESS",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "THU" },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "#f3f3f3",
                                padding: "EVEN_LESS",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "FRI" },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "#f3f3f3",
                                padding: "EVEN_LESS",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "SAT" },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "#f3f3f3",
                                padding: "EVEN_LESS",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          )
                        },
                        marginBelow: "NONE",
                        spacing: "NONE",
                        showDividers: true
                      ),
                      a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                      a!columnsLayout(
                        columns: {
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "29" },
                                              color: "SECONDARY",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "30" },
                                              color: "SECONDARY",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "31" },
                                              color: "SECONDARY",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "1" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "2" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "3" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "4" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          )
                        },
                        marginBelow: "NONE",
                        spacing: "NONE",
                        showDividers: true
                      ),
                      a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                      a!columnsLayout(
                        columns: {
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "5" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "6" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "7" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "8" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "9" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "10" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "11" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          )
                        },
                        marginBelow: "NONE",
                        spacing: "NONE",
                        showDividers: true
                      ),
                      a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                      a!columnsLayout(
                        columns: {
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "12" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "13" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "14" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  ),
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "exclamation-triangle",
                                        color: "NEGATIVE",
                                        size: "SMALL"
                                      ),
                                      a!richTextItem(
                                        text: { " Review new claim for Park, K." },
                                        size: "SMALL"
                                      )
                                    },
                                    preventWrapping: true,
                                    marginBelow: "EVEN_LESS"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "15" },
                                              color: "STANDARD",
                                              size: "MEDIUM",
                                              style: { "STRONG" }
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  ),
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "circle",
                                        color: "#6d9eeb",
                                        size: "SMALL"
                                      ),
                                      a!richTextItem(
                                        text: {
                                          " Generate renewal quote for Mendez, S."
                                        },
                                        size: "SMALL"
                                      )
                                    },
                                    preventWrapping: true,
                                    marginBelow: "EVEN_LESS"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "16" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  ),
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "square",
                                        color: "#93c47d",
                                        size: "SMALL"
                                      ),
                                      a!richTextItem(
                                        text: { " Respond to new customer query" },
                                        size: "SMALL"
                                      )
                                    },
                                    preventWrapping: true,
                                    marginBelow: "EVEN_LESS"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "17" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  ),
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "circle",
                                        color: "#6d9eeb",
                                        size: "SMALL"
                                      ),
                                      a!richTextItem(
                                        text: { " Update contact information" },
                                        size: "SMALL"
                                      )
                                    },
                                    preventWrapping: true,
                                    marginBelow: "EVEN_LESS"
                                  ),
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "circle",
                                        color: "#6d9eeb",
                                        size: "SMALL"
                                      ),
                                      a!richTextItem(
                                        text: { " Generate holiday card list" },
                                        size: "SMALL"
                                      )
                                    },
                                    preventWrapping: true,
                                    marginBelow: "EVEN_LESS"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "18" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          )
                        },
                        marginBelow: "NONE",
                        spacing: "NONE",
                        showDividers: true
                      ),
                      a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                      a!columnsLayout(
                        columns: {
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "19" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "20" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "21" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "22" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "23" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "24" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "25" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          )
                        },
                        marginBelow: "NONE",
                        spacing: "NONE",
                        showDividers: true
                      ),
                      a!horizontalLine(marginAbove: "NONE", marginBelow: "NONE"),
                      a!columnsLayout(
                        columns: {
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "26" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "27" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "28" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "29" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "30" },
                                              color: "STANDARD",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "1" },
                                              color: "SECONDARY",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          ),
                          a!columnLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!sideBySideLayout(
                                    items: {
                                      a!sideBySideItem(
                                        item: a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "2" },
                                              color: "SECONDARY",
                                              size: "MEDIUM"
                                            )
                                          },
                                          align: "RIGHT"
                                        )
                                      )
                                    },
                                    alignVertical: "MIDDLE"
                                  )
                                },
                                height: local!dayHeight,
                                style: "TRANSPARENT",
                                marginBelow: "NONE",
                                showBorder: false
                              )
                            }
                          )
                        },
                        marginBelow: "NONE",
                        spacing: "NONE",
                        showDividers: true
                      )
                    },
                    height: "AUTO",
                    style: "NONE",
                    shape: "ROUNDED",
                    padding: "NONE",
                    marginBelow: "NONE",
                    showBorder: false,
                    showShadow: true
                  )
                },
                
              )
            }
          ),
          /*Extra spacing for two column layout on landscape tablet and narrow desktop*/
          a!columnLayout(
            width: "1X",
            contents: {},
            showWhen: a!isPageWidth({ "TABLET_LANDSCAPE", "DESKTOP_NARROW",  })
          ),
          
        },
        showWhen: not(
          a!isPageWidth(
            {
              "DESKTOP_WIDE",
              "DESKTOP",
              "TABLET_PORTRAIT",
              "PHONE"
            }
          )
        )
      )
    },
    backgroundColor: "#f4f2f1",
    contentsPadding: "MORE"
  )
)
