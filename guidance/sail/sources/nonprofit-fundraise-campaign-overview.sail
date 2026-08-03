a!headerContentLayout(
  header: {
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {}),
            a!columnLayout(
              contents: {
                a!headingField(
                  fontWeight: "LIGHT",
                  headingTag: "H1",
                  marginBelow: "NONE",
                  text: "Saving the Earth's polar habitats through the power of crowdsourced gifting.",
                  size: if(a!isPageWidth({"PHONE","TABLET_PORTRAIT"}),"MEDIUM_PLUS","LARGE")
                )
              },
              width: "MEDIUM_PLUS"
            ),
            a!columnLayout(
              contents: {
                a!imageField(
                  label: "Image",
                  labelPosition: "COLLAPSED",
                  /* This is a placeholder image; replace as needed */
                  images: {
                    a!documentImage(
                      document: a!EXAMPLE_DOCUMENT_IMAGE()
                    )
                  },
                  size: "FIT",
                  isThumbnail: false,
                  style: "STANDARD"
                )
              },
              width: if(a!isPageWidth({"TABLET_PORTRAIT"}),"MEDIUM","WIDE")
            ),
            a!columnLayout(contents: {})
          },
          alignVertical: "MIDDLE",
          marginBelow: "NONE",
          stackWhen: { "PHONE", "TABLET_PORTRAIT" }
        )
      },
      height: "AUTO",
      style: "#333F48",
      padding: "STANDARD",
      marginBelow: "NONE",
      showBorder: false
    ),
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(
              contents: {
                a!columnsLayout(
                  columns: {
                    a!columnLayout(
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            "GIFT DOLLARS TO TARGET"
                          }
                        ),
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextIcon(
                                    icon: "money",
                                    color: "SECONDARY",
                                    size: "MEDIUM_PLUS"
                                  ),
                                  a!richTextItem(
                                    text: {
                                      " 82.9%"
                                    },
                                    size: "MEDIUM_PLUS",
                                    style: {
                                      "STRONG"
                                    }
                                  )
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextIcon(
                                    icon: "caret-up",
                                    color: "POSITIVE",
                                    size: "STANDARD"
                                  ),
                                  a!richTextItem(
                                    text: {
                                      "1.9%"
                                    },
                                    color: "STANDARD",
                                    size: "STANDARD"
                                  )
                                }
                              ),
                              width: "MINIMIZE"
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
                            "DONOR RETENTION"
                          }
                        ),
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextIcon(
                                    icon: "user-circle-o",
                                    color: "SECONDARY",
                                    size: "MEDIUM_PLUS"
                                  ),
                                  a!richTextItem(
                                    text: {
                                      " 74.2%"
                                    },
                                    size: "MEDIUM_PLUS",
                                    style: {
                                      "STRONG"
                                    }
                                  )
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextIcon(
                                    icon: "caret-down",
                                    color: "NEGATIVE",
                                    size: "STANDARD"
                                  ),
                                  a!richTextItem(
                                    text: {
                                      "2.3%"
                                    },
                                    color: "STANDARD",
                                    size: "STANDARD"
                                  )
                                }
                              ),
                              width: "MINIMIZE"
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
                            "NEW DONORS TO TARGET"
                          }
                        ),
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextIcon(
                                    icon: "user-plus",
                                    color: "SECONDARY",
                                    size: "MEDIUM_PLUS"
                                  ),
                                  a!richTextItem(
                                    text: {
                                      " 91.6%"
                                    },
                                    size: "MEDIUM_PLUS",
                                    style: {
                                      "STRONG"
                                    }
                                  )
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextIcon(
                                    icon: "caret-up",
                                    color: "POSITIVE",
                                    size: "STANDARD"
                                  ),
                                  a!richTextItem(
                                    text: {
                                      "3.0%"
                                    },
                                    color: "STANDARD",
                                    size: "STANDARD"
                                  )
                                }
                              ),
                              width: "MINIMIZE"
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
                            "RECURRING GIFT RATE"
                          }
                        ),
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextIcon(
                                    icon: "refresh",
                                    color: "SECONDARY",
                                    size: "MEDIUM_PLUS"
                                  ),
                                  a!richTextItem(
                                    text: {
                                      " 48.5%"
                                    },
                                    size: "MEDIUM_PLUS",
                                    style: {
                                      "STRONG"
                                    }
                                  )
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextIcon(
                                    icon: "caret-down",
                                    color: "NEGATIVE",
                                    size: "STANDARD"
                                  ),
                                  a!richTextItem(
                                    text: {
                                      "5.1%"
                                    },
                                    color: "STANDARD",
                                    size: "STANDARD"
                                  )
                                }
                              ),
                              width: "MINIMIZE"
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
                            "ACTIVE CAMPAIGNS"
                          }
                        ),
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextIcon(
                                    icon: "bullhorn",
                                    color: "SECONDARY",
                                    size: "MEDIUM_PLUS"
                                  ),
                                  a!richTextItem(
                                    text: {
                                      " 11"
                                    },
                                    size: "MEDIUM_PLUS",
                                    style: {
                                      "STRONG"
                                    }
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
                  spacing: "SPARSE",
                  showDividers: true
                )
              },
              width: "WIDE_PLUS"
            ),
            a!columnLayout(
              contents: {},
              width: "AUTO"
            ),
            a!columnLayout(
              contents: {
                a!buttonArrayLayout(
                  buttons: {
                    a!buttonWidget(
                      label: "NEW CAMPAIGN",
                      icon: "plus-circle",
                      size: "LARGE",
                      style: "OUTLINE"
                    )
                  },
                  align: "END",
                  marginBelow: "NONE"
                )
              },
              width: "NARROW"
            )
          },
          alignVertical: "MIDDLE"
        )
      },
      height: "AUTO",
      showWhen: false,
      style: "#eee",
      padding: "STANDARD",
      marginBelow: "NONE",
      showBorder: false
    )
  },
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(
          contents: {}
        ),
        a!columnLayout(
          contents: {
            a!cardLayout(
              contents: {
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextItem(
                      text: {
                        "2023 Goal"
                      },
                      size: "MEDIUM_PLUS"
                    )
                  }
                ),
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextItem(
                            text: {
                              "$85,000,000"
                            },
                            size: "LARGE_PLUS"
                          )
                        }
                      )
                    ),
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextIcon(
                            icon: "arrow-up",
                            color: "POSITIVE",
                            size: "LARGE_PLUS"
                          ),
                          a!richTextItem(
                            text: {
                              "13%"
                            },
                            size: "LARGE_PLUS",
                            style: {
                              "STRONG"
                            }
                          )
                        }
                      ),
                      width: "MINIMIZE"
                    )
                  },
                  marginBelow: "MORE",
                  stackWhen: {
                    "PHONE",
                    "TABLET_PORTRAIT"
                  }
                ),
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          "2022 GOAL",
                          char(10),
                          a!richTextItem(
                            text: {
                              "$75,000,000"
                            },
                            size: "LARGE"
                          ),
                          char(10),
                          char(10),
                          a!richTextItem(
                            text: {
                              "2022 ACTUAL"
                            },
                            size: "STANDARD"
                          ),
                          char(10),
                          a!richTextItem(
                            text: {
                              "$73,291,578"
                            },
                            size: "LARGE"
                          )
                        }
                      )
                    ),
                    a!sideBySideItem(
                      item: a!gaugeField(
                        labelPosition: "COLLAPSED",
                        percentage: 97.7,
                        primaryText: a!gaugePercentage(),
                        color: "#619ed6",
                        size: "MEDIUM",
                        marginBelow: "NONE"
                      ),
                      width: "MINIMIZE"
                    )
                  },
                  alignVertical: "MIDDLE",
                  stackWhen: {
                    "PHONE",
                    "TABLET_PORTRAIT"
                  }
                )
              },
              height: "AUTO",
              style: "#394c5a",
              padding: "STANDARD",
              marginBelow: "STANDARD",
              showBorder: false
            )
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(
          contents: {
            a!cardLayout(
              contents: {
                a!cardLayout(
                  contents: {},
                  height: "AUTO",
                  style: "#394c5a",
                  marginBelow: "NONE",
                  showBorder: false
                ),
                a!columnsLayout(
                  columns: {
                    a!columnLayout(
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: {
                                "2021"
                              },
                              size: "MEDIUM_PLUS"
                            )
                          },
                          align: "CENTER"
                        )
                      }
                    ),
                    a!columnLayout(
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: {
                                "2022"
                              },
                              size: "MEDIUM_PLUS"
                            )
                          },
                          align: "CENTER"
                        )
                      }
                    ),
                    a!columnLayout(
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: {
                                "2023"
                              },
                              size: "MEDIUM_PLUS"
                            )
                          },
                          align: "CENTER"
                        )
                      }
                    )
                  },
                  marginBelow: "MORE",
                  stackWhen: {
                    "NEVER"
                  }
                ),
                a!columnsLayout(
                  columns: {
                    a!columnLayout(
                      contents: {
                        a!pieChartField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          series: {
                            a!chartSeries(label: "Chart Series 1", data: 1),
                            a!chartSeries(label: "Chart Series 2", data: 2),
                            a!chartSeries(label: "Chart Series 3", data: 3)
                          },
                          showDataLabels: false,
                          colorScheme: "CLASSIC",
                          style: "DONUT",
                          seriesLabelStyle: "NONE",
                          height: "SHORT"
                        )
                      }
                    ),
                    a!columnLayout(
                      contents: {
                        a!pieChartField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          series: {
                            a!chartSeries(label: "Chart Series 1", data: 2),
                            a!chartSeries(label: "Chart Series 2", data: 2),
                            a!chartSeries(label: "Chart Series 3", data: 2)
                          },
                          showDataLabels: false,
                          colorScheme: "CLASSIC",
                          style: "DONUT",
                          seriesLabelStyle: "NONE",
                          height: "SHORT"
                        )
                      }
                    ),
                    a!columnLayout(
                      contents: {
                        a!pieChartField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          series: {
                            a!chartSeries(label: "Chart Series 1", data: 4),
                            a!chartSeries(label: "Chart Series 2", data: 3),
                            a!chartSeries(label: "Chart Series 3", data: 1)
                          },
                          showDataLabels: false,
                          colorScheme: "CLASSIC",
                          style: "DONUT",
                          seriesLabelStyle: "NONE",
                          height: "SHORT"
                        )
                      }
                    )
                  },
                  marginBelow: "STANDARD",
                  stackWhen: {
                    "NEVER"
                  }
                ),
                a!sideBySideLayout(
                  items: {
                    a!sideBySideItem(),
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextIcon(
                            icon: "circle",
                            color: "#619ed6"
                          ),
                          " Existing Donors"
                        }
                      ),
                      width: "MINIMIZE"
                    ),
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextIcon(
                            icon: "circle",
                            color: "#6ba547"
                          ),
                          " Online Campaigns"
                        }
                      ),
                      width: "MINIMIZE"
                    ),
                    a!sideBySideItem(
                      item: a!richTextDisplayField(
                        labelPosition: "COLLAPSED",
                        value: {
                          a!richTextIcon(
                            icon: "circle",
                            color: "#f7d027"
                          ),
                          " Direct Outreach"
                        }
                      ),
                      width: "MINIMIZE"
                    ),
                    a!sideBySideItem()
                  },
                  spacing: "SPARSE",
                  marginBelow: "MORE"
                )
              },
              height: "AUTO",
              style: "#394c5a",
              padding: "STANDARD",
              marginBelow: "STANDARD",
              showBorder: false
            )
          },
          width: "WIDE"
        ),
        a!columnLayout(
          contents: {}
        )
      },
      spacing: "STANDARD",
      stackWhen: {
        "PHONE",
        "TABLET_PORTRAIT",
        "TABLET_LANDSCAPE",
        "DESKTOP_NARROW"
      }
    )
  },
  backgroundColor: "#333F48",
  showWhen: true,
  contentsPadding: "EVEN_MORE"
)
