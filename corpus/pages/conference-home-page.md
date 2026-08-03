# Conference Home Page [SAIL Design System: Inspiration]

*Section: inspiration | source: https://docs.appian.com/suite/help/26.7/sail/conference-home-page.html | images referenced live in corpus/images/*

← Back to Inspiration Gallery

# Conference Home Page

Please select which platform you'd like to see a preview of this layout on:
 
 **Desktop
 **Mobile*
 
 
 Jump to expression
 **

![Preview of a desktop SAIL layout for a(n) conference home page](../images/ESG_conference_portal_home.png)

```sail
a!headerContentLayout(
  header: {
    a!billboardLayout(
      backgroundMedia: a!webImage(
        source: "https://images.unsplash.com/photo-1615209852901-ebdb472411c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3474&q=80"
      ),
      backgroundColor: "#f0f0f0",
      height: if(
        a!isPageWidth({ "PHONE" }),
        "TALL_PLUS",
        "EXTRA_TALL"
      ),
      marginBelow: "EVEN_MORE",
      overlay: a!fullOverlay(
        alignVertical: "TOP",
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
                      a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
                    },
                    size: if(
                      a!isPageWidth(
                        {
                          "PHONE",
                          "TABLET_PORTRAIT",
                          "TABLET_LANDSCAPE"
                        }
                      ),
                      "MEDIUM",
                      "FIT"
                    ),
                    isThumbnail: false,
                    style: "STANDARD"
                  )
                },
                width: "NARROW_PLUS"
              ),
              a!columnLayout(
                contents: {
                  a!columnsLayout(
                    columns: {
                      a!columnLayout(
                        contents: {
                          a!sideBySideLayout(
                            items: {
                              a!sideBySideItem(
                                showWhen: a!isPageWidth(
                                  {
                                    "DESKTOP_NARROW",
                                    "DESKTOP",
                                    "DESKTOP_WIDE"
                                  }
                                )
                              ),
                              a!sideBySideItem(
                                item: a!richTextDisplayField(
                                  labelPosition: "COLLAPSED",
                                  value: {
                                    a!richTextItem(
                                      text: { "ENGLISH" },
                                      link: a!dynamicLink(),
                                      linkStyle: "STANDALONE",
                                      color: "#111111",
                                      style: { "STRONG", "UNDERLINE" }
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
                                      text: { "简体中文" },
                                      link: a!dynamicLink(),
                                      linkStyle: "STANDALONE",
                                      color: "#111111"
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
                                      text: { "हिन्दी" },
                                      link: a!dynamicLink(),
                                      linkStyle: "STANDALONE",
                                      color: "#111111"
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
                                      text: { "ESPAÑOL" },
                                      link: a!dynamicLink(),
                                      linkStyle: "STANDALONE",
                                      color: "#111111"
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
                                      text: { "FRANÇAIS" },
                                      link: a!dynamicLink(),
                                      linkStyle: "STANDALONE",
                                      color: "#111111"
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
                                      text: { "العربية" },
                                      link: a!dynamicLink(),
                                      linkStyle: "STANDALONE",
                                      color: "#111111"
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
                                      text: { "DEUTSCHE" },
                                      link: a!dynamicLink(),
                                      linkStyle: "STANDALONE",
                                      color: "#111111"
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
                                      text: { "日本語" },
                                      link: a!dynamicLink(),
                                      linkStyle: "STANDALONE",
                                      color: "#111111"
                                    )
                                  }
                                ),
                                width: "MINIMIZE"
                              )
                            },
                            spacing: "SPARSE"
                          )
                        }
                      )
                    },
                    alignVertical: "MIDDLE",
                    showWhen: a!isPageWidth(
                      {
                        "TABLET_PORTRAIT",
                        "TABLET_LANDSCAPE",
                        "DESKTOP_NARROW",
                        "DESKTOP",
                        "DESKTOP_WIDE"
                      }
                    )
                  )
                }
              )
            },
            alignVertical: "MIDDLE",
            stackWhen: {
              "PHONE",
              "TABLET_PORTRAIT",
              "TABLET_LANDSCAPE"
            }
          ),
          a!columnsLayout(
            columns: {
              a!columnLayout(contents: {}, width: "EXTRA_NARROW"),
              a!columnLayout(
                contents: {
                  a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: { char(10), char(10) },
                    showWhen: a!isPageWidth(
                      {
                        "DESKTOP_NARROW",
                        "DESKTOP",
                        "DESKTOP_WIDE"
                      }
                    ),
                    marginAbove: "NONE",
                    marginBelow: "NONE"
                  ),
                  a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {
                      a!richTextItem(
                        text: {
                          "ESG World is the most important global gathering of advocates and thought leaders on ",
                          a!richTextItem(
                            text: { "Environmental" },
                            style: { "STRONG" }
                          ),
                          ", ",
                          a!richTextItem(text: { "Social" }, style: { "STRONG" }),
                          ", and ",
                          a!richTextItem(text: { "Governance" }, style: { "STRONG" }),
                          " topics."
                        },
                        size: "MEDIUM_PLUS"
                      )
                    },
                    marginAbove: "EVEN_MORE"
                  ),
                  a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {
                      a!richTextItem(
                        text: { "25–27 April, 2023" },
                        size: "MEDIUM_PLUS",
                        style: { "STRONG" }
                      )
                    },
                    marginAbove: "EVEN_MORE"
                  ),
                  a!richTextDisplayField(
                    labelPosition: "COLLAPSED",
                    value: {
                      a!richTextItem(
                        text: { "Copenhagen, Denmark" },
                        size: "MEDIUM_PLUS"
                      ),
                      char(10),
                      a!richTextItem(
                        text: { "And online worldwide" },
                        size: "MEDIUM"
                      ),
                      char(10)
                    },
                    marginBelow: "MORE"
                  ),
                  a!buttonArrayLayout(
                    buttons: {
                      a!buttonWidget(
                        label: "Register Now",
                        size: "LARGE",
                        style: "SOLID"
                      )
                    },
                    align: "START"
                  )
                },
                width: "MEDIUM_PLUS"
              ),
              a!columnLayout(contents: {})
            }
          )
        },
        style: if(
          a!isPageWidth({ "PHONE" }),
          "SEMI_LIGHT",
          "NONE"
        )
      )
    )
  },
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(contents: {}),
        a!columnLayout(
          contents: {
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: { "ATTENDEES" },
                  color: "ACCENT",
                  style: { "STRONG" }
                )
              }
            ),
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: { "Top Experts from around the Globe" },
                  color: "STANDARD",
                  size: "MEDIUM_PLUS"
                )
              }
            ),
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
              }
            )
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(
          contents: {
            a!imageField(
              label: "",
              labelPosition: "COLLAPSED",
              images: {
                a!webImage(
                  source: "https://images.unsplash.com/photo-1462331321792-cc44368b8894?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2753&q=80",
                  altText: "Photo of forest"
                )
              },
              size: "FIT",
              isThumbnail: false,
              style: "STANDARD"
            )
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(contents: {})
      },
      marginBelow: "EVEN_MORE",
      stackWhen: { "PHONE", "TABLET_PORTRAIT" }
    ),
    a!columnsLayout(
      columns: {
        a!columnLayout(contents: {}),
        a!columnLayout(
          contents: {
            a!imageField(
              label: "",
              labelPosition: "COLLAPSED",
              images: {
                a!webImage(
                  source: "https://images.unsplash.com/photo-1473448912268-2022ce9509d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2282&q=80",
                  altText: "Photo of forest"
                )
              },
              size: "FIT",
              isThumbnail: false,
              style: "STANDARD"
            )
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(
          contents: {
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: { "TOPICS" },
                  color: "ACCENT",
                  style: { "STRONG" }
                )
              }
            ),
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: { "Relevant Discussions for Our Times" },
                  color: "STANDARD",
                  size: "MEDIUM_PLUS"
                )
              }
            ),
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
              }
            )
          },
          width: "MEDIUM_PLUS"
        ),
        a!columnLayout(contents: {})
      },
      marginBelow: "EVEN_MORE",
      stackWhen: { "PHONE", "TABLET_PORTRAIT" }
    )
  },
  backgroundColor: "#f8f6f0"
)
```
