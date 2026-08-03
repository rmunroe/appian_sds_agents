# Insurance Claim Case Summary [SAIL Design System: Inspiration]

*Section: inspiration | source: https://docs.appian.com/suite/help/26.7/sail/ins-claim-case-study.html | images referenced live in corpus/images/*

← Back to Inspiration Gallery

# Insurance Claim Case Summary

Please select which platform you'd like to see a preview of this layout on:
 
 **Desktop
 **Mobile*
 
 
 Jump to expression
 **

![Preview of a desktop SAIL layout for a(n) insurance claim case summary](../images/insurance_claim_case_summary.png)

```sail
a!headerContentLayout(
  header: {
    a!cardLayout(
      contents: {
        a!cardLayout(
          contents: {
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: {
                    a!richTextItem(
                      text: {
                        a!richTextIcon(icon: "arrow-circle-right"),
                        " What's next? "
                      },
                      style: { "STRONG" }
                    ),
                    "Your insurance adjuster has inspected your vehicle and will soon issue an itemized estimate of repair costs. "
                  },
                  size: "MEDIUM"
                )
              }
            )
          },
          height: "AUTO",
          style: "#cfe2f3",
          padding: "STANDARD",
          marginBelow: "NONE",
          showBorder: false
        )
      },
      height: "AUTO",
      style: "NONE",
      padding: "NONE",
      marginBelow: "STANDARD"
    ),
    a!cardLayout(
      contents: {},
      height: "AUTO",
      style: "#fff",
      padding: "NONE",
      marginBelow: "MORE",
      showBorder: false
    )
  },
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Claim Progress",
              labelSize: "MEDIUM",
              labelColor: "STANDARD",
              contents: {
                a!columnsLayout(
                  columns: {
                    a!columnLayout(
                      contents: {
                        a!stampField(
                          labelPosition: "COLLAPSED",
                          icon: "car-crash",
                          backgroundColor: "POSITIVE",
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
                              text: { "Loss Occurred" },
                              size: "STANDARD",
                              style: { "STRONG" }
                            )
                          },
                          preventWrapping: true,
                          align: if(
                            a!isPageWidth({ "PHONE" }),
                            "CENTER",
                            "LEFT"
                          ),
                          marginAbove: "NONE",
                          marginBelow: "NONE"
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(text: { "September 13" }, size: "SMALL")
                          },
                          preventWrapping: true,
                          align: if(
                            a!isPageWidth({ "PHONE" }),
                            "CENTER",
                            "LEFT"
                          ),
                          marginAbove: "NONE",
                          marginBelow: "NONE"
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
                          icon: "check-circle-o",
                          backgroundColor: "POSITIVE",
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
                              text: { "Claim Filed" },
                              size: "STANDARD",
                              style: { "STRONG" }
                            )
                          },
                          preventWrapping: true,
                          align: if(
                            a!isPageWidth({ "PHONE" }),
                            "CENTER",
                            "LEFT"
                          ),
                          marginAbove: "NONE",
                          marginBelow: "NONE"
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(text: { "September 13" }, size: "SMALL")
                          },
                          preventWrapping: true,
                          align: if(
                            a!isPageWidth({ "PHONE" }),
                            "CENTER",
                            "LEFT"
                          ),
                          marginAbove: "NONE",
                          marginBelow: "NONE"
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
                          icon: "check-circle-o",
                          backgroundColor: "POSITIVE",
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
                              text: { "Vehicle Inspected" },
                              size: "STANDARD",
                              style: { "STRONG" }
                            )
                          },
                          preventWrapping: true,
                          align: if(
                            a!isPageWidth({ "PHONE" }),
                            "CENTER",
                            "LEFT"
                          ),
                          marginAbove: "NONE",
                          marginBelow: "NONE"
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(text: { "September 15" }, size: "SMALL")
                          },
                          preventWrapping: true,
                          align: if(
                            a!isPageWidth({ "PHONE" }),
                            "CENTER",
                            "LEFT"
                          ),
                          marginAbove: "NONE",
                          marginBelow: "NONE"
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
                          icon: "file-text-o",
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
                              text: { "Estimate Issued" },
                              size: "STANDARD"
                            )
                          },
                          preventWrapping: true,
                          align: if(
                            a!isPageWidth({ "PHONE" }),
                            "CENTER",
                            "LEFT"
                          ),
                          marginAbove: "NONE",
                          marginBelow: "NONE"
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
                          icon: "money",
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
                            a!richTextItem(text: { "Payment Sent" }, size: "STANDARD")
                          },
                          preventWrapping: true,
                          align: if(
                            a!isPageWidth({ "PHONE" }),
                            "CENTER",
                            "LEFT"
                          ),
                          marginAbove: "NONE",
                          marginBelow: "NONE"
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
                          icon: "stamp",
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
                            a!richTextItem(text: { "Claim Closed" }, size: "STANDARD")
                          },
                          preventWrapping: true,
                          align: if(
                            a!isPageWidth({ "PHONE" }),
                            "CENTER",
                            "LEFT"
                          ),
                          marginAbove: "NONE",
                          marginBelow: "NONE"
                        )
                      }
                    )
                  },
                  alignVertical: "MIDDLE",
                  marginBelow: "NONE",
                  spacing: "NONE"
                )
              }
            )
          },
          width: "NARROW_PLUS"
        ),
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Insured Driver",
              labelSize: "MEDIUM",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!sectionLayout(
                      label: "",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!sideBySideLayout(
                          items: {
                            a!sideBySideItem(
                              item: a!stampField(
                                labelPosition: "COLLAPSED",
                                text: "S",
                                backgroundColor: "#118bf1",
                                contentColor: "STANDARD",
                                size: "SMALL"
                              ),
                              width: "MINIMIZE"
                            ),
                            a!sideBySideItem(
                              item: a!richTextDisplayField(
                                labelPosition: "COLLAPSED",
                                value: {
                                  a!richTextItem(
                                    text: { "Sharif" },
                                    size: "MEDIUM_PLUS",
                                    style: { "STRONG" }
                                  )
                                }
                              )
                            ),
                            a!sideBySideItem(
                              item: a!tagField(
                                labelPosition: "COLLAPSED",
                                tags: {
                                  a!tagItem(
                                    text: "GOOD DRIVER DISCOUNT",
                                    backgroundColor: "#45818e"
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
                  height: "AUTO",
                  style: "NONE",
                  padding: "STANDARD",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              },
              marginBelow: "MORE"
            ),
            a!sectionLayout(
              label: "Details of Loss",
              labelSize: "MEDIUM",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!sectionLayout(
                      label: "LOCATION",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { "Beverly Hills, CA 90210" },
                              size: "MEDIUM_PLUS"
                            )
                          }
                        ),
                        a!webContentField(
                          label: "Map",
                          labelPosition: "COLLAPSED",
                          source: "https://maps.google.com/maps?q=rodeo%20drive%20and%20wilshire&t=&z=15&ie=UTF8&iwloc=&output=embed",
                          height: "SHORT",
                          showBorder: true
                        ),
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: {
                                a!richTextIcon(icon: "map-pin"),
                                " Rodeo Dr and Wilshire Blvd"
                              },
                              size: "STANDARD"
                            )
                          }
                        )
                      },
                      divider: "BELOW",
                      marginBelow: "STANDARD"
                    ),
                    a!sectionLayout(
                      label: "DATE & TIME",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { "Sep 13, 2021 3:00PM" },
                              size: "MEDIUM_PLUS"
                            )
                          }
                        )
                      },
                      divider: "BELOW"
                    ),
                    a!sectionLayout(
                      label: "TYPE OF LOSS",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(text: { "Collision" }, size: "MEDIUM_PLUS")
                          }
                        )
                      }
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  padding: "STANDARD",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              },
              marginBelow: "MORE"
            )
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(
          contents: {
            a!sectionLayout(
              label: "Insured Vehicle & Damage",
              labelSize: "MEDIUM",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!stampField(
                            labelPosition: "COLLAPSED",
                            icon: "car",
                            text: "",
                            backgroundColor: "#a64d79",
                            contentColor: "STANDARD",
                            size: "SMALL"
                          ),
                          width: "MINIMIZE"
                        ),
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: { "2009 Saab 9-5" },
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
                                text: { "YS3EH58GX13004109" },
                                color: "SECONDARY",
                                size: "MEDIUM"
                              )
                            }
                          ),
                          width: "MINIMIZE"
                        )
                      },
                      alignVertical: "MIDDLE"
                    ),
                    a!sectionLayout(
                      label: "INSPECTION PHOTOS",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  labelPosition: "COLLAPSED",
                                  /* This is a placeholder image; replace as needed */
                                  images: {
                                    a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
                                  },
                                  size: "FIT",
                                  isThumbnail: true,
                                  style: "STANDARD"
                                )
                              }
                            ),
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  labelPosition: "COLLAPSED",
                                  /* This is a placeholder image; replace as needed */
                                  images: {
                                    a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
                                  },
                                  size: "FIT",
                                  isThumbnail: true,
                                  style: "STANDARD"
                                )
                              }
                            ),
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  labelPosition: "COLLAPSED",
                                  /* This is a placeholder image; replace as needed */
                                  images: {
                                    a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
                                  },
                                  size: "FIT",
                                  isThumbnail: true,
                                  style: "STANDARD"
                                )
                              }
                            ),
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  labelPosition: "COLLAPSED",
                                  /* This is a placeholder image; replace as needed */
                                  images: {
                                    a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
                                  },
                                  size: "FIT",
                                  isThumbnail: true,
                                  style: "STANDARD"
                                )
                              }
                            )
                          },
                          spacing: "DENSE"
                        )
                      }
                    ),
                    a!sectionLayout(
                      label: "VEHICLE CONDITION",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { "Not Drivable - Towed" },
                              size: "MEDIUM_PLUS"
                            )
                          }
                        )
                      },
                      divider: "BELOW"
                    ),
                    a!sectionLayout(
                      label: "DAMAGE SUMMARY",
                      labelSize: "SMALL",
                      labelHeadingTag: "H3",
                      labelColor: "SECONDARY",
                      contents: {
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(contents: {}),
                            a!columnLayout(
                              contents: {
                                a!columnsLayout(
                                  columns: {
                                    a!columnLayout(
                                      contents: {
                                        a!tagField(
                                          labelPosition: "COLLAPSED",
                                          tags: {
                                            a!tagItem(
                                              text: "R FRONT",
                                              backgroundColor: "NEGATIVE"
                                            )
                                          },
                                          size: "SMALL",
                                          align: "CENTER"
                                        )
                                      }
                                    ),
                                    a!columnLayout(contents: {})
                                  },
                                  alignVertical: "BOTTOM"
                                )
                              },
                              width: "NARROW_PLUS"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(
                              contents: {
                                a!tagField(
                                  labelPosition: "COLLAPSED",
                                  tags: {
                                    a!tagItem(
                                      text: "FRONT",
                                      backgroundColor: "NEGATIVE"
                                    )
                                  },
                                  size: "SMALL",
                                  align: "END"
                                )
                              }
                            ),
                            a!columnLayout(
                              contents: {
                                a!imageField(
                                  label: "",
                                  labelPosition: "COLLAPSED",
                                  /* This is a placeholder image; replace as needed */
                                  images: {
                                    a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
                                  },
                                  size: "FIT",
                                  isThumbnail: false,
                                  style: "STANDARD"
                                )
                              },
                              width: "NARROW_PLUS"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE"
                        ),
                        a!columnsLayout(
                          columns: {
                            a!columnLayout(contents: {}),
                            a!columnLayout(
                              contents: {
                                a!columnsLayout(
                                  columns: {
                                    a!columnLayout(
                                      contents: {
                                        a!tagField(
                                          labelPosition: "COLLAPSED",
                                          tags: {
                                            a!tagItem(
                                              text: "L FRONT",
                                              backgroundColor: "NEGATIVE"
                                            )
                                          },
                                          size: "SMALL",
                                          align: "CENTER"
                                        )
                                      }
                                    ),
                                    a!columnLayout(
                                      contents: {
                                        a!tagField(
                                          labelPosition: "COLLAPSED",
                                          tags: {
                                            a!tagItem(
                                              text: "L REAR",
                                              backgroundColor: "NEGATIVE"
                                            )
                                          },
                                          size: "SMALL",
                                          align: "END"
                                        )
                                      }
                                    )
                                  }
                                )
                              },
                              width: "NARROW_PLUS"
                            ),
                            a!columnLayout(contents: {})
                          },
                          alignVertical: "MIDDLE"
                        )
                      }
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  padding: "STANDARD",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              },
              marginBelow: "MORE"
            ),
            a!sectionLayout(
              label: "Repair Status",
              labelSize: "MEDIUM",
              labelHeadingTag: "H2",
              labelColor: "STANDARD",
              contents: {
                a!cardLayout(
                  contents: {
                    a!richTextDisplayField(
                      labelPosition: "COLLAPSED",
                      value: {
                        a!richTextIcon(
                          icon: "clock-o",
                          color: "#a4c2f4",
                          size: "EXTRA_LARGE"
                        ),
                        char(10),
                        char(10),
                        a!richTextItem(
                          text: { "Waiting for Estimate" },
                          color: "SECONDARY",
                          size: "MEDIUM_PLUS"
                        )
                      },
                      align: "CENTER"
                    )
                  },
                  height: "AUTO",
                  style: "NONE",
                  padding: "EVEN_MORE",
                  marginBelow: "STANDARD",
                  showBorder: false,
                  showShadow: true
                )
              },
              marginBelow: "MORE"
            )
          },
          width: "AUTO"
        )
      },
      stackWhen: {
        "PHONE",
        "TABLET_PORTRAIT",
        "TABLET_LANDSCAPE"
      }
    )
  },
  backgroundColor: "TRANSPARENT"
)
```
