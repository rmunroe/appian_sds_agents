a!headerContentLayout(
  header: {
    a!billboardLayout(
      backgroundMedia: a!webImage(
        source: "https://images.unsplash.com/photo-1550757627-155698319664?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3270&q=80"
      ),
      backgroundColor: "#f0f0f0",
      height: "EXTRA_TALL",
      marginBelow: "NONE",
      overlay: a!fullOverlay(
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
                        document: a!EXAMPLE_DOCUMENT_IMAGE(),
                        altText: "Boreas Logo"
                      )
                    },
                    size: if(
                      a!isPageWidth({ "PHONE", "TABLET_PORTRAIT" }),
                      "MEDIUM",
                      "FIT"
                    ),
                    isThumbnail: false,
                    style: "STANDARD"
                  )
                },
                width: "NARROW_PLUS"
              ),
              a!columnLayout(contents: {}),
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
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "Welcome" },
                                        color: "#ffffff",
                                        size: "MEDIUM",
                                        style: { "STRONG" }
                                      )
                                    },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "TRANSPARENT",
                                padding: "LESS",
                                marginBelow: "NONE",
                                showBorder: false,
                                accessibilityText: "Navigation Tab (Selected)"
                              ),
                              a!columnsLayout(
                                columns: {
                                  a!columnLayout(contents: {}),
                                  a!columnLayout(
                                    contents: {
                                      a!cardLayout(
                                        contents: {},
                                        height: "AUTO",
                                        style: "NONE",
                                        padding: "NONE",
                                        marginBelow: "NONE",
                                        showBorder: true
                                      )
                                    },
                                    width: "EXTRA_NARROW"
                                  ),
                                  a!columnLayout(contents: {})
                                },
                                spacing: "NONE",
                                stackWhen: { "NEVER" }
                              )
                            },
                            link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                            height: "AUTO",
                            style: "TRANSPARENT",
                            padding: "NONE",
                            marginBelow: "NONE",
                            showBorder: false
                          )
                        }
                      ),
                      a!columnLayout(
                        contents: {
                          a!cardLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "How to Help" },
                                        color: "#ffffff",
                                        size: "MEDIUM"
                                      )
                                    },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "TRANSPARENT",
                                padding: "LESS",
                                marginBelow: "NONE",
                                showBorder: false,
                                accessibilityText: "Navigation Tab (Not Selected)"
                              )
                            },
                            link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                            height: "AUTO",
                            style: "TRANSPARENT",
                            padding: "NONE",
                            marginBelow: "NONE",
                            showBorder: false
                          )
                        }
                      ),
                      a!columnLayout(
                        contents: {
                          a!cardLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "Our Story" },
                                        color: "#ffffff",
                                        size: "MEDIUM"
                                      )
                                    },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "TRANSPARENT",
                                padding: "LESS",
                                marginBelow: "NONE",
                                showBorder: false,
                                accessibilityText: "Navigation Tab (Not Selected)"
                              )
                            },
                            link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                            height: "AUTO",
                            style: "TRANSPARENT",
                            padding: "NONE",
                            marginBelow: "NONE",
                            showBorder: false
                          )
                        }
                      ),
                      a!columnLayout(
                        contents: {
                          a!cardLayout(
                            contents: {
                              a!cardLayout(
                                contents: {
                                  a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "Contact Us" },
                                        color: "#ffffff",
                                        size: "MEDIUM"
                                      )
                                    },
                                    preventWrapping: true,
                                    align: "CENTER"
                                  )
                                },
                                height: "AUTO",
                                style: "TRANSPARENT",
                                padding: "LESS",
                                marginBelow: "NONE",
                                showBorder: false,
                                accessibilityText: "Navigation Tab (Not Selected)"
                              )
                            },
                            link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                            height: "AUTO",
                            style: "TRANSPARENT",
                            padding: "NONE",
                            marginBelow: "NONE",
                            showBorder: false
                          )
                        }
                      )
                    },
                    alignVertical: "TOP",
                    spacing: "NONE"
                  )
                },
                width: "MEDIUM_PLUS"
              )
            },
            alignVertical: "MIDDLE",
            stackWhen: { "PHONE", "TABLET_PORTRAIT" }
          ),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: {
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              a!richTextItem(
                text: {
                  "A N T A R C T I C A   N E E D S   H E L P"
                },
                color: "#ffffff",
                size: "EXTRA_LARGE"
              )
            },
            showWhen: a!isPageWidth({ "DESKTOP_WIDE" }),
            align: "CENTER",
            marginAbove: "EVEN_MORE"
          ),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: {
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              a!richTextItem(
                text: {
                  "A N T A R C T I C A   N E E D S   H E L P"
                },
                color: "#ffffff",
                size: "LARGE_PLUS"
              )
            },
            showWhen: a!isPageWidth({ "DESKTOP" }),
            align: "CENTER",
            marginAbove: "EVEN_MORE"
          ),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: {
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              char(10),
              a!richTextItem(
                text: {
                  "A N T A R C T I C A   N E E D S   H E L P"
                },
                color: "#ffffff",
                size: "LARGE"
              )
            },
            showWhen: a!isPageWidth(
              {
                "DESKTOP_NARROW",
                "TABLET_LANDSCAPE",
                "TABLET_PORTRAIT"
              }
            ),
            align: "CENTER",
            marginAbove: "EVEN_MORE"
          ),
          a!richTextDisplayField(
            labelPosition: "COLLAPSED",
            value: {
              char(10),
              char(10),
              char(10),
              char(10),
              a!richTextItem(
                text: { "ANTARCTICA  NEEDS  HELP" },
                color: "STANDARD",
                size: "LARGE"
              )
            },
            showWhen: a!isPageWidth({ "PHONE" }),
            align: "CENTER",
            marginAbove: "EVEN_MORE"
          )
        },
        style: "SEMI_DARK"
      )
    )
  },
  contents: {
    a!cardLayout(
      contents: {
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {}),
            a!columnLayout(
              contents: {
                a!columnsLayout(
                  columns: {
                    a!columnLayout(contents: {}),
                    a!columnLayout(
                      contents: {
                        a!cardLayout(
                          contents: {},
                          height: "AUTO",
                          style: "TRANSPARENT",
                          marginBelow: "NONE",
                          showBorder: false,
                          decorativeBarPosition: "TOP"
                        )
                      },
                      width: "EXTRA_NARROW"
                    ),
                    a!columnLayout(contents: {})
                  },
                  marginAbove: "MORE",
                  marginBelow: "NONE",
                  stackWhen: { "NEVER" }
                ),
                a!richTextDisplayField(
                  labelPosition: "COLLAPSED",
                  value: {
                    a!richTextItem(text: { "What We Do" }, size: "LARGE")
                  },
                  align: "CENTER",
                  marginBelow: "MORE"
                ),
                a!cardGroupLayout(
                  labelPosition: "COLLAPSED",
                  cards: {
                    a!cardLayout(
                      contents: {
                        a!billboardLayout(
                          backgroundMedia: a!webImage(
                            source: "https://images.unsplash.com/photo-1551415923-a2297c7fda79?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3264&q=80"
                          ),
                          backgroundColor: "#f0f0f0",
                          height: "SHORT",
                          marginBelow: "NONE"
                        ),
                        a!cardLayout(
                          contents: {
                            a!stampField(
                              labelPosition: "COLLAPSED",
                              icon: "leaf",
                              backgroundColor: "TRANSPARENT",
                              contentColor: "STANDARD",
                              size: "TINY",
                              align: "CENTER"
                            ),
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Conservation" },
                                  size: "MEDIUM",
                                  style: { "STRONG" }
                                )
                              },
                              align: "CENTER"
                            ),
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce purus est, condimentum et nulla ac, rutrum iaculis massa. Nam rhoncus consectetur mauris, at pretium massa scelerisque vel. Quisque tempus justo ex, nec feugiat dui ornare in. In ut quam ultricies, venenatis nulla non, interdum elit."
                              },
                              align: "CENTER"
                            )
                          },
                          height: "AUTO",
                          style: "TRANSPARENT",
                          padding: "STANDARD",
                          marginBelow: "NONE",
                          showBorder: false
                        )
                      },
                      height: "AUTO",
                      style: "NONE",
                      padding: "NONE",
                      marginBelow: "MORE"
                    ),
                    a!cardLayout(
                      contents: {
                        a!billboardLayout(
                          backgroundMedia: a!webImage(
                            source: "https://images.unsplash.com/photo-1582592621737-d5ab435305cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"
                          ),
                          backgroundColor: "#f0f0f0",
                          height: "SHORT",
                          marginBelow: "NONE"
                        ),
                        a!cardLayout(
                          contents: {
                            a!stampField(
                              labelPosition: "COLLAPSED",
                              icon: "microscope",
                              backgroundColor: "TRANSPARENT",
                              contentColor: "STANDARD",
                              size: "TINY",
                              align: "CENTER"
                            ),
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Research" },
                                  size: "MEDIUM",
                                  style: { "STRONG" }
                                )
                              },
                              align: "CENTER"
                            ),
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                "Praesent a libero enim. Vestibulum posuere, urna a ultricies rhoncus, enim quam finibus lorem, at pulvinar mi lorem eu orci. Quisque consectetur pellentesque sagittis. Maecenas in tellus sed orci pretium venenatis. Ut vitae ligula metus. Etiam bibendum finibus purus vel commodo."
                              },
                              align: "CENTER"
                            )
                          },
                          height: "AUTO",
                          style: "TRANSPARENT",
                          padding: "STANDARD",
                          marginBelow: "NONE",
                          showBorder: false
                        )
                      },
                      height: "AUTO",
                      style: "NONE",
                      padding: "NONE",
                      marginBelow: "MORE"
                    ),
                    a!cardLayout(
                      contents: {
                        a!billboardLayout(
                          backgroundMedia: a!webImage(
                            source: "https://images.unsplash.com/photo-1602137925482-00fb0ed07877?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"
                          ),
                          backgroundColor: "#f0f0f0",
                          height: "SHORT",
                          marginBelow: "NONE"
                        ),
                        a!cardLayout(
                          contents: {
                            a!stampField(
                              labelPosition: "COLLAPSED",
                              icon: "chalkboard-teacher",
                              backgroundColor: "TRANSPARENT",
                              contentColor: "STANDARD",
                              size: "TINY",
                              align: "CENTER"
                            ),
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                a!richTextItem(
                                  text: { "Education" },
                                  size: "MEDIUM",
                                  style: { "STRONG" }
                                )
                              },
                              align: "CENTER"
                            ),
                            a!richTextDisplayField(
                              labelPosition: "COLLAPSED",
                              value: {
                                "Vivamus tincidunt eros neque. Suspendisse lobortis nulla magna, in finibus massa tincidunt non. Donec semper ligula nec mollis blandit. Vestibulum eu imperdiet libero. Quisque rutrum turpis et dolor congue, quis blandit felis congue. Praesent eget mattis lectus. Etiam at tempor dui. Praesent non ornare massa."
                              },
                              align: "CENTER"
                            )
                          },
                          height: "AUTO",
                          style: "TRANSPARENT",
                          padding: "STANDARD",
                          marginBelow: "NONE",
                          showBorder: false
                        )
                      },
                      height: "AUTO",
                      style: "NONE",
                      padding: "NONE",
                      marginBelow: "MORE"
                    )
                  },
                  cardWidth: "NARROW"
                )
              },
              width: "WIDE_PLUS"
            ),
            a!columnLayout(contents: {})
          },
          stackWhen: {
            "PHONE",
            "TABLET_PORTRAIT",
            "TABLET_LANDSCAPE",
            "DESKTOP_NARROW"
          }
        )
      },
      height: "AUTO",
      style: "#f3f3f3",
      padding: "MORE",
      marginBelow: "NONE",
      showBorder: false,
      decorativeBarColor: "#efefef"
    ),
    a!cardLayout(
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
                        a!cardLayout(
                          contents: {
                            a!sideBySideLayout(
                              items: {
                                a!sideBySideItem(width: "MINIMIZE"),
                                a!sideBySideItem(
                                  item: a!richTextDisplayField(
                                    labelPosition: "COLLAPSED",
                                    value: {
                                      a!richTextItem(
                                        text: { "Start Helping Today" },
                                        size: "LARGE"
                                      )
                                    }
                                  )
                                )
                              }
                            )
                          },
                          height: "AUTO",
                          style: "TRANSPARENT",
                          padding: "NONE",
                          marginBelow: "MORE",
                          showBorder: false,
                          decorativeBarPosition: "START",
                          decorativeBarColor: "ACCENT"
                        ),
                        a!radioButtonField(
                          choiceLabels: { "$5", "$25", "$50", "$100", "$250", "Other" },
                          choiceValues: { 1, 2, 3, 4, 5, 6 },
                          label: "Gift Amount",
                          labelPosition: "COLLAPSED",
                          value: 2,
                          saveInto: {},
                          choiceLayout: "COMPACT",
                          choiceStyle: "CARDS",
                          validations: {}
                        ),
                        a!buttonArrayLayout(
                          buttons: {
                            a!buttonWidget(
                              label: "Donate",
                              icon: "hands-helping",
                              size: "LARGE",
                              style: "SOLID"
                            )
                          },
                          align: "START",
                          marginAbove: "MORE"
                        )
                      }
                    ),
                    a!columnLayout(
                      contents: {
                        a!cardLayout(
                          contents: {
                            a!imageField(
                              label: "",
                              labelPosition: "COLLAPSED",
                              images: {
                                a!webImage(
                                  source: "https://images.unsplash.com/photo-1551415923-51267c1f2d73?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3432&q=80"
                                )
                              },
                              size: "FIT",
                              isThumbnail: false,
                              style: "STANDARD"
                            )
                          },
                          height: "AUTO",
                          style: "TRANSPARENT",
                          padding: "NONE",
                          marginBelow: "NONE",
                          showBorder: true,
                          showShadow: false
                        )
                      }
                    )
                  },
                  marginAbove: "EVEN_MORE",
                  marginBelow: "EVEN_MORE",
                  stackWhen: { "PHONE", "TABLET_PORTRAIT" }
                )
              },
              width: "WIDE_PLUS"
            ),
            a!columnLayout(contents: {})
          },
          stackWhen: {
            "PHONE",
            "TABLET_PORTRAIT",
            "TABLET_LANDSCAPE",
            "DESKTOP_NARROW"
          }
        )
      },
      height: "AUTO",
      style: "#fcfcfc",
      padding: "MORE",
      marginBelow: "NONE",
      showBorder: false,
      decorativeBarColor: "#efefef"
    ),
    a!cardLayout(
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
                        a!imageField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          /* This is a placeholder image; replace as needed */
                          images: {
                            a!documentImage(
                              document: a!EXAMPLE_DOCUMENT_IMAGE(),
                              altText: "Boreas Logo"
                            )
                          },
                          size: "MEDIUM",
                          isThumbnail: false,
                          style: "STANDARD",
                          align: "START"
                        )
                      },
                      width: "AUTO"
                    ),
                    a!columnLayout(
                      contents: {
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "Boreas Home",
                              uri: "https://www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        ),
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "Create an Account",
                              uri: "https://www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        ),
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "Payment Issues",
                              uri: "https://www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        ),
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "Customer Service",
                              uri: "https://www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        )
                      },
                      width: "NARROW_PLUS"
                    ),
                    a!columnLayout(
                      contents: {
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "Tax Information",
                              uri: "https://www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        ),
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "Leadership",
                              uri: "https://www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        ),
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "Financial Information",
                              uri: "https://www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        )
                      },
                      width: "NARROW_PLUS"
                    )
                  },
                  stackWhen: { "PHONE", "TABLET_PORTRAIT" }
                )
              },
              width: "WIDE_PLUS"
            ),
            a!columnLayout(contents: {})
          }
        )
      },
      height: "AUTO",
      style: "#111",
      padding: "MORE",
      marginBelow: "NONE",
      showBorder: false,
      decorativeBarPosition: "TOP",
      decorativeBarColor: "#351c75"
    )
  },
  contentsPadding: "NONE"
)
