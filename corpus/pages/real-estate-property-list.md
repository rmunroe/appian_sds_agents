# Real Estate Property List [SAIL Design System: Inspiration]

*Section: inspiration | source: https://docs.appian.com/suite/help/26.7/sail/real-estate-property-list.html | images referenced live in corpus/images/*

← Back to Inspiration Gallery

# Real Estate Property List

Please select which platform you'd like to see a preview of this layout on:
 
 **Desktop
 **Mobile*
 
 
 Jump to expression
 **

![Preview of a desktop SAIL layout for a(n) real estate property list](../images/real_estate_property_list.png)

```sail
a!headerContentLayout(
  header: {},
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(
          contents: {
            a!cardLayout(
              height: "AUTO",
              style: "#232020",
              marginBelow: "NONE",
              showBorder: false
            ),
            a!cardLayout(
              contents: {
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextIcon(icon: "tachometer", size: "MEDIUM_PLUS")
                  },
                  align: "CENTER"
                )
              },
              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
              tooltip: "My Dashboard",
              height: "AUTO",
              style: "#232020",
              marginBelow: "NONE",
              showBorder: false
            ),
            a!cardLayout(
              contents: {
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextIcon(icon: "home", size: "MEDIUM_PLUS")
                  },
                  align: "CENTER"
                )
              },
              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
              tooltip: "Properties",
              height: "AUTO",
              style: "#990000",
              marginBelow: "NONE",
              showBorder: false
            ),
            a!cardLayout(
              contents: {
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextIcon(icon: "street-view", size: "MEDIUM_PLUS")
                  },
                  align: "CENTER"
                )
              },
              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
              tooltip: "Customers",
              height: "AUTO",
              style: "#232020",
              marginBelow: "NONE",
              showBorder: false
            ),
            a!cardLayout(
              contents: {
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextIcon(icon: "university", size: "MEDIUM_PLUS")
                  },
                  align: "CENTER"
                )
              },
              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
              tooltip: "Lending",
              height: "AUTO",
              style: "#232020",
              marginBelow: "NONE",
              showBorder: false
            ),
            a!cardLayout(
              contents: {
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextIcon(icon: "line-chart", size: "MEDIUM_PLUS")
                  },
                  align: "CENTER"
                )
              },
              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
              tooltip: "Performance",
              height: "AUTO",
              style: "#232020",
              marginBelow: "NONE",
              showBorder: false
            ),
            a!cardLayout(
              contents: {
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextIcon(icon: "users", size: "MEDIUM_PLUS")
                  },
                  align: "CENTER"
                )
              },
              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
              tooltip: "Team",
              height: "AUTO",
              style: "#232020",
              marginBelow: "NONE",
              showBorder: false
            ),
            a!cardLayout(
              height: "EXTRA_TALL",
              style: "#232020",
              marginBelow: "NONE",
              showBorder: false
            ),
            a!cardLayout(
              height: "EXTRA_TALL",
              style: "#232020",
              marginBelow: "NONE",
              showBorder: false
            )
          },
          width: "EXTRA_NARROW",
          showWhen: not(
            a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" })
          )
        ),
        a!columnLayout(
          contents: {
            a!columnsLayout(
              columns: {
                a!columnLayout(
                  contents: {
                    a!cardLayout(
                      contents: {
                        a!cardLayout(
                          contents: {
                            a!sectionLayout(
                              label: "Properties",
                              labelSize: "MEDIUM",
                              labelColor: "STANDARD",
                              contents: {
                                a!buttonArrayLayout(
                                  buttons: {
                                    a!buttonWidget(
                                      label: "New Listing",
                                      icon: "plus-circle",
                                      size: "LARGE",
                                      width: "FILL",
                                      style: "SOLID"
                                    )
                                  },
                                  align: "START"
                                )
                              },
                              divider: "NONE",
                              marginBelow: "NONE"
                            )
                          },
                          height: "AUTO",
                          style: "NONE",
                          padding: "STANDARD",
                          marginBelow: "NONE",
                          showBorder: false
                        ),
                        a!cardLayout(
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "   " },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "user-circle-o",
                                        color: "ACCENT",
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "  " },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "My Listings" },
                                        color: "ACCENT",
                                        size: "MEDIUM",
                                        style: { "STRONG" }
                                      )
                                    },
                                    preventWrapping: true
                                  ),
                                  width: "AUTO"
                                )
                              },
                              alignVertical: "MIDDLE",
                              spacing: "DENSE",
                              marginBelow: "NONE"
                            )
                          },
                          link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                          height: "AUTO",
                          style: "NONE",
                          padding: "LESS",
                          marginBelow: "NONE",
                          showBorder: false
                        ),
                        a!cardLayout(
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "   " },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "sun-o",
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "  " },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "New Listings" },
                                        color: "#666666",
                                        size: "MEDIUM"
                                      )
                                    },
                                    preventWrapping: true
                                  ),
                                  width: "AUTO"
                                )
                              },
                              alignVertical: "MIDDLE",
                              spacing: "DENSE",
                              marginBelow: "NONE"
                            )
                          },
                          link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                          height: "AUTO",
                          style: "NONE",
                          padding: "LESS",
                          marginBelow: "NONE",
                          showBorder: false
                        ),
                        a!cardLayout(
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "   " },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "search",
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "  " },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "Search Listings" },
                                        color: "#666666",
                                        size: "MEDIUM"
                                      )
                                    },
                                    preventWrapping: true
                                  ),
                                  width: "AUTO"
                                )
                              },
                              alignVertical: "MIDDLE",
                              spacing: "DENSE",
                              marginBelow: "NONE"
                            )
                          },
                          link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                          height: "AUTO",
                          style: "NONE",
                          padding: "LESS",
                          marginBelow: "NONE",
                          showBorder: false
                        ),
                        a!cardLayout(
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "   " },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextIcon(
                                        icon: "handshake-o",
                                        color: "SECONDARY",
                                        size: "MEDIUM_PLUS"
                                      )
                                    },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: { "  " },
                                    align: "CENTER"
                                  ),
                                  width: "MINIMIZE"
                                ),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "Sold Properties" },
                                        color: "#666666",
                                        size: "MEDIUM"
                                      )
                                    },
                                    preventWrapping: true
                                  ),
                                  width: "AUTO"
                                )
                              },
                              alignVertical: "MIDDLE",
                              spacing: "DENSE",
                              marginBelow: "NONE"
                            )
                          },
                          link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                          height: "AUTO",
                          style: "NONE",
                          padding: "LESS",
                          marginBelow: "NONE",
                          showBorder: false
                        ),
                        a!cardLayout(
                          contents: {},
                          height: "EXTRA_TALL",
                          style: "NONE",
                          marginBelow: "NONE",
                          showBorder: false
                        ),
                        a!cardLayout(
                          contents: {},
                          height: "EXTRA_TALL",
                          style: "NONE",
                          marginBelow: "NONE",
                          showBorder: false
                        )
                      },
                      height: "AUTO",
                      style: "NONE",
                      padding: "NONE",
                      marginBelow: "NONE",
                      showBorder: false
                    )
                  },
                  width: "NARROW_PLUS",
                  showWhen: not(a!isPageWidth({ "PHONE" }))
                ),
                a!columnLayout(
                  contents: {
                    a!cardLayout(
                      contents: {
                        a!cardGroupLayout(
                          labelPosition: "COLLAPSED",
                          cards: {
                            a!cardLayout(
                              contents: {
                                a!billboardLayout(
                                  backgroundMedia: a!webImage(
                                    source: "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80"
                                  ),
                                  backgroundColor: "#f0f0f0",
                                  height: "SHORT_PLUS",
                                  marginBelow: "NONE",
                                  overlay: a!fullOverlay(
                                    alignVertical: "TOP",
                                    contents: {
                                      a!tagField(
                                        labelPosition: "COLLAPSED",
                                        tags: {
                                          a!tagItem(
                                            text: "NEW LISTING",
                                            backgroundColor: "#ff9900"
                                          )
                                        }
                                      )
                                    },
                                    style: "NONE"
                                  )
                                ),
                                a!cardLayout(
                                  contents: {
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(text: { "$1,695,000" }, size: "MEDIUM_PLUS")
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(
                                                text: { a!richTextIcon(icon: "calendar"), " 2d" },
                                                color: "SECONDARY",
                                                size: "MEDIUM"
                                              )
                                            }
                                          ),
                                          width: "MINIMIZE"
                                        )
                                      },
                                      alignVertical: "MIDDLE",
                                      marginBelow: "STANDARD"
                                    ),
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(text: { "3 Beds  " }, size: "STANDARD"),
                                        "•  2.5 Baths  •  2,403 Sq. Ft.",
                                        char(10),
                                        a!richTextItem(
                                          text: {
                                            "12345 Maple Ave, Palm Springs, CA 92262"
                                          },
                                          size: "SMALL"
                                        )
                                      },
                                      preventWrapping: false
                                    )
                                  },
                                  height: "AUTO",
                                  style: "NONE",
                                  padding: "STANDARD",
                                  marginBelow: "NONE",
                                  showBorder: false
                                )
                              },
                              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                              height: "AUTO",
                              style: "NONE",
                              shape: "ROUNDED",
                              padding: "NONE",
                              marginBelow: "STANDARD"
                            ),
                            a!cardLayout(
                              contents: {
                                a!billboardLayout(
                                  backgroundMedia: a!webImage(
                                    source: "https://images.unsplash.com/photo-1575517111478-7f6afd0973db?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80"
                                  ),
                                  backgroundColor: "#f0f0f0",
                                  height: "SHORT_PLUS",
                                  marginBelow: "NONE",
                                  overlay: a!fullOverlay(
                                    alignVertical: "TOP",
                                    contents: {
                                      a!tagField(
                                        labelPosition: "COLLAPSED",
                                        tags: {
                                          a!tagItem(
                                            text: "OPEN HOUSE SCHEDULED",
                                            backgroundColor: "#38761d"
                                          )
                                        }
                                      )
                                    },
                                    style: "NONE"
                                  )
                                ),
                                a!cardLayout(
                                  contents: {
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(text: { "$2,150,000" }, size: "MEDIUM_PLUS")
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(
                                                text: { a!richTextIcon(icon: "calendar"), " 15d" },
                                                color: "SECONDARY",
                                                size: "MEDIUM"
                                              )
                                            }
                                          ),
                                          width: "MINIMIZE"
                                        )
                                      },
                                      alignVertical: "MIDDLE",
                                      marginBelow: "STANDARD"
                                    ),
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(text: { "4 Beds  " }, size: "STANDARD"),
                                        "•  3.5 Baths  •  2,942 Sq. Ft.",
                                        char(10),
                                        a!richTextItem(
                                          text: {
                                            "2345 Mesa Blvd, Palm Springs, CA 92264"
                                          },
                                          size: "SMALL"
                                        )
                                      },
                                      preventWrapping: false
                                    )
                                  },
                                  height: "AUTO",
                                  style: "NONE",
                                  padding: "STANDARD",
                                  marginBelow: "NONE",
                                  showBorder: false
                                )
                              },
                              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                              height: "AUTO",
                              style: "NONE",
                              shape: "ROUNDED",
                              padding: "NONE",
                              marginBelow: "STANDARD"
                            ),
                            a!cardLayout(
                              contents: {
                                a!billboardLayout(
                                  backgroundMedia: a!webImage(
                                    source: "https://images.unsplash.com/photo-1582268611958-ebfd161ef9cf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80"
                                  ),
                                  backgroundColor: "#f0f0f0",
                                  height: "SHORT_PLUS",
                                  marginBelow: "NONE",
                                  overlay: a!fullOverlay(
                                    alignVertical: "TOP",
                                    contents: {
                                      a!tagField(
                                        labelPosition: "COLLAPSED",
                                        tags: {
                                          a!tagItem(
                                            text: "OPEN HOUSE SCHEDULED",
                                            backgroundColor: "#38761d"
                                          )
                                        }
                                      )
                                    },
                                    style: "NONE"
                                  )
                                ),
                                a!cardLayout(
                                  contents: {
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(text: { "$1,945,000" }, size: "MEDIUM_PLUS")
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(
                                                text: { a!richTextIcon(icon: "calendar"), " 26d" },
                                                color: "SECONDARY",
                                                size: "MEDIUM"
                                              )
                                            }
                                          ),
                                          width: "MINIMIZE"
                                        )
                                      },
                                      alignVertical: "MIDDLE",
                                      marginBelow: "STANDARD"
                                    ),
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(text: { "3 Beds  " }, size: "STANDARD"),
                                        "•  2.5 Baths  •  2,178 Sq. Ft.",
                                        char(10),
                                        a!richTextItem(
                                          text: {
                                            "345 Main St, Cathedral City, CA 92234"
                                          },
                                          size: "SMALL"
                                        )
                                      },
                                      preventWrapping: false
                                    )
                                  },
                                  height: "AUTO",
                                  style: "NONE",
                                  padding: "STANDARD",
                                  marginBelow: "NONE",
                                  showBorder: false
                                )
                              },
                              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                              height: "AUTO",
                              style: "NONE",
                              shape: "ROUNDED",
                              padding: "NONE",
                              marginBelow: "STANDARD"
                            ),
                            a!cardLayout(
                              contents: {
                                a!billboardLayout(
                                  backgroundMedia: a!webImage(
                                    source: "https://images.unsplash.com/photo-1538963732282-4b2b48c7a4b8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2555&q=80"
                                  ),
                                  backgroundColor: "#f0f0f0",
                                  height: "SHORT_PLUS",
                                  marginBelow: "NONE",
                                  overlay: a!fullOverlay(
                                    alignVertical: "TOP",
                                    contents: {
                                      a!tagField(
                                        labelPosition: "COLLAPSED",
                                        tags: {
                                          a!tagItem(
                                            text: "NO OFFERS RECEIVED",
                                            backgroundColor: "#cc0000"
                                          )
                                        }
                                      )
                                    },
                                    style: "NONE"
                                  )
                                ),
                                a!cardLayout(
                                  contents: {
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(text: { "$1,723,000" }, size: "MEDIUM_PLUS")
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(
                                                text: { a!richTextIcon(icon: "calendar"), " 42d" },
                                                color: "SECONDARY",
                                                size: "MEDIUM"
                                              )
                                            }
                                          ),
                                          width: "MINIMIZE"
                                        )
                                      },
                                      alignVertical: "MIDDLE",
                                      marginBelow: "STANDARD"
                                    ),
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(text: { "3 Beds  " }, size: "STANDARD"),
                                        "•  3 Baths  •  2,230 Sq. Ft.",
                                        char(10),
                                        a!richTextItem(
                                          text: {
                                            "567 Fountain St, Hot Springs, CA 92241"
                                          },
                                          size: "SMALL"
                                        )
                                      },
                                      preventWrapping: false
                                    )
                                  },
                                  height: "AUTO",
                                  style: "NONE",
                                  padding: "STANDARD",
                                  marginBelow: "NONE",
                                  showBorder: false
                                )
                              },
                              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                              height: "AUTO",
                              style: "NONE",
                              shape: "ROUNDED",
                              padding: "NONE",
                              marginBelow: "STANDARD"
                            ),
                            a!cardLayout(
                              contents: {
                                a!billboardLayout(
                                  backgroundMedia: a!webImage(
                                    source: "https://images.unsplash.com/photo-1613977257592-4871e5fcd7c4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzR8fGhvdXNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60"
                                  ),
                                  backgroundColor: "#f0f0f0",
                                  height: "SHORT_PLUS",
                                  marginBelow: "NONE",
                                  overlay: a!fullOverlay(
                                    alignVertical: "TOP",
                                    contents: {
                                      a!tagField(
                                        labelPosition: "COLLAPSED",
                                        tags: {
                                          a!tagItem(
                                            text: "PRICE REDUCED",
                                            backgroundColor: "#3c78d8"
                                          )
                                        }
                                      )
                                    },
                                    style: "NONE"
                                  )
                                ),
                                a!cardLayout(
                                  contents: {
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(text: { "$2,092,000" }, size: "MEDIUM_PLUS")
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(
                                                text: { a!richTextIcon(icon: "calendar"), " 33d" },
                                                color: "SECONDARY",
                                                size: "MEDIUM"
                                              )
                                            }
                                          ),
                                          width: "MINIMIZE"
                                        )
                                      },
                                      alignVertical: "MIDDLE",
                                      marginBelow: "STANDARD"
                                    ),
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(text: { "5 Beds  " }, size: "STANDARD"),
                                        "•  4.5 Baths  •  3,219 Sq. Ft.",
                                        char(10),
                                        a!richTextItem(
                                          text: {
                                            "45678 Desert Ln, Palm Desert, CA 92260"
                                          },
                                          size: "SMALL"
                                        )
                                      },
                                      preventWrapping: false
                                    )
                                  },
                                  height: "AUTO",
                                  style: "NONE",
                                  padding: "STANDARD",
                                  marginBelow: "NONE",
                                  showBorder: false
                                )
                              },
                              link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                              height: "AUTO",
                              style: "NONE",
                              shape: "ROUNDED",
                              padding: "NONE",
                              marginBelow: "STANDARD"
                            )
                          },
                          cardWidth: "NARROW_PLUS"
                        )
                      },
                      height: "AUTO",
                      style: "#f0f0f0",
                      padding: "MORE",
                      marginBelow: "STANDARD",
                      showBorder: false
                    )
                  }
                )
              },
              spacing: "NONE",
              stackWhen: { "NEVER" },
              showDividers: true
            )
          }
        )
      },
      spacing: "NONE",
      stackWhen: { "NEVER" }
    )
  },
  backgroundColor: "TRANSPARENT",
  showWhen: true,
  contentsPadding: "NONE"
)
```
