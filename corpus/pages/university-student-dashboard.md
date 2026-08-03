# University Student Dashboard [SAIL Design System: Inspiration]

*Section: inspiration | source: https://docs.appian.com/suite/help/26.7/sail/university-student-dashboard.html | images referenced live in corpus/images/*

← Back to Inspiration Gallery

# University Student Dashboard

Please select which platform you'd like to see a preview of this layout on:
 
 **Desktop
 **Mobile*
 
 
 Jump to expression
 **

![Preview of a desktop SAIL layout for a(n) university student dashboard](../images/university_student_dashboard.png)

```sail
a!headerContentLayout(
  header: {},
  contents: {
    a!columnsLayout(
      columns: {
        a!columnLayout(
          contents: {
            a!cardLayout(
              contents: {
                a!sectionLayout(
                  label: "",
                  contents: {
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!imageField(
                            label: "Profile Photo",
                            labelPosition: "COLLAPSED",
                            images: { a!userImage(user: fn!loggedInUser()) },
                            size: "SMALL",
                            isThumbnail: false,
                            style: "AVATAR"
                          ),
                          width: "MINIMIZE"
                        ),
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(
                                text: { "Karen Anderson" },
                                size: "MEDIUM",
                                style: { "STRONG" }
                              ),
                              char(10),
                              a!richTextItem(text: { "***-**-1234" }, size: "STANDARD")
                            }
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  },
                  divider: "BELOW",
                  marginAbove: "STANDARD"
                ),
                a!cardLayout(
                  contents: {
                    a!sideBySideLayout(
                      items: {
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextItem(text: { "❘" }, color: "ACCENT", size: "LARGE")
                            }
                          ),
                          width: "MINIMIZE"
                        ),
                        a!sideBySideItem(
                          item: a!richTextDisplayField(
                            labelPosition: "COLLAPSED",
                            value: {
                              a!richTextIcon(
                                icon: "home",
                                color: "ACCENT",
                                size: "STANDARD"
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
                                text: { "Home" },
                                color: "ACCENT",
                                size: "MEDIUM",
                                style: { "STRONG" }
                              )
                            },
                            preventWrapping: true
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  },
                  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                  tooltip: "",
                  height: "AUTO",
                  padding: "NONE",
                  marginAbove: "LESS",
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
                            value: {
                              a!richTextItem(
                                text: { "❘" },
                                color: "#ffffff",
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
                              a!richTextIcon(
                                icon: "chalkboard-teacher",
                                color: "#444",
                                size: "STANDARD"
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
                                text: { "Classes" },
                                color: "#444",
                                size: "MEDIUM"
                              )
                            },
                            preventWrapping: true
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  },
                  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                  tooltip: "",
                  height: "AUTO",
                  padding: "NONE",
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
                            value: {
                              a!richTextItem(
                                text: { "❘" },
                                color: "#ffffff",
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
                              a!richTextIcon(
                                icon: "hand-holding-heart",
                                color: "#444",
                                size: "STANDARD"
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
                                text: { "Health & Safety" },
                                color: "#444",
                                size: "MEDIUM"
                              )
                            },
                            preventWrapping: true
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  },
                  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                  tooltip: "",
                  height: "AUTO",
                  padding: "NONE",
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
                            value: {
                              a!richTextItem(
                                text: { "❘" },
                                color: "#ffffff",
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
                              a!richTextIcon(
                                icon: "building-o",
                                color: "#444",
                                size: "STANDARD"
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
                                text: { "Housing & Residence Life" },
                                color: "#444",
                                size: "MEDIUM"
                              )
                            },
                            preventWrapping: true
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  },
                  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                  tooltip: "",
                  height: "AUTO",
                  padding: "NONE",
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
                            value: {
                              a!richTextItem(
                                text: { "❘" },
                                color: "#ffffff",
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
                              a!richTextIcon(
                                icon: "university",
                                color: "#444",
                                size: "STANDARD"
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
                                text: { "Tuition & Financial Aid" },
                                color: "#444",
                                size: "MEDIUM"
                              )
                            },
                            preventWrapping: true
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  },
                  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                  tooltip: "",
                  height: "AUTO",
                  padding: "NONE",
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
                            value: {
                              a!richTextItem(
                                text: { "❘" },
                                color: "#ffffff",
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
                              a!richTextIcon(
                                icon: "handshake-o",
                                color: "#444",
                                size: "STANDARD"
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
                                text: { "Career Services" },
                                color: "#444",
                                size: "MEDIUM"
                              )
                            },
                            preventWrapping: true
                          )
                        )
                      },
                      alignVertical: "MIDDLE"
                    )
                  },
                  link: a!dynamicLink(label: "Dynamic Link", saveInto: {}),
                  tooltip: "",
                  height: "AUTO",
                  padding: "NONE",
                  marginBelow: "NONE",
                  showBorder: false
                ),
                a!sectionLayout(
                  label: "",
                  contents: {
                    a!cardLayout(
                      contents: {
                        a!richTextDisplayField(
                          labelPosition: "COLLAPSED",
                          value: {
                            a!richTextItem(
                              text: { "QUICK ACCESS" },
                              color: "SECONDARY"
                            )
                          }
                        ),
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "Student Clinic Appointments",
                              uri: "www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        ),
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "Maintenance Request",
                              uri: "www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        ),
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "University Course Catalog",
                              uri: "www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        ),
                        a!linkField(
                          label: "",
                          labelPosition: "COLLAPSED",
                          links: {
                            a!safeLink(
                              label: "Student Events Calendar",
                              uri: "www.appian.com",
                              openLinkIn: "NEW_TAB"
                            )
                          }
                        )
                      },
                      height: "AUTO",
                      style: "NONE",
                      marginBelow: "NONE",
                      showBorder: false
                    )
                  },
                  divider: "ABOVE",
                  marginAbove: "EVEN_MORE"
                ),
                a!cardLayout(
                  contents: {},
                  height: "EXTRA_TALL",
                  style: "NONE",
                  marginBelow: "STANDARD",
                  showBorder: false
                ),
                a!cardLayout(
                  contents: {},
                  height: "EXTRA_TALL",
                  style: "NONE",
                  marginBelow: "STANDARD",
                  showBorder: false
                )
              },
              height: "AUTO",
              style: "NONE",
              padding: "LESS",
              marginBelow: "NONE",
              showBorder: false,
              showShadow: true
            )
          },
          width: "NARROW_PLUS"
        ),
        a!columnLayout(
          contents: {
            a!cardLayout(
              contents: {
                a!columnsLayout(
                  columns: {
                    a!columnLayout(
                      contents: {
                        a!sectionLayout(
                          label: "My Class Schedule",
                          labelSize: "MEDIUM",
                          labelColor: "STANDARD",
                          contents: {
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
                                              a!richTextItem(text: { "Monday" }, size: "MEDIUM")
                                            }
                                          )
                                        )
                                      },
                                      alignVertical: "MIDDLE"
                                    )
                                  },
                                  marginBelow: "NONE"
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
                                                text: { "9:00AM – 10:00AM" },
                                                style: { "STRONG" }
                                              )
                                            }
                                          ),
                                          width: "2X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              "CS 3100 Data Structures & Algorithms II"
                                            }
                                          ),
                                          width: "5X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(icon: "map-marker"),
                                              " Thompson 404"
                                            }
                                          ),
                                          width: "2X"
                                        )
                                      },
                                      alignVertical: "TOP"
                                    )
                                  },
                                  divider: "ABOVE",
                                  marginBelow: "NONE"
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
                                                text: { "12:45PM – 2:15PM" },
                                                style: { "STRONG" }
                                              )
                                            }
                                          ),
                                          width: "2X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: { "CS 3205 HCI in Software Development" }
                                          ),
                                          width: "5X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(icon: "map-marker"),
                                              " Flores A201"
                                            }
                                          ),
                                          width: "2X"
                                        )
                                      },
                                      alignVertical: "TOP"
                                    )
                                  },
                                  divider: "ABOVE",
                                  marginBelow: "NONE"
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
                                                text: { "4:00PM – 5:30PM" },
                                                style: { "STRONG" }
                                              )
                                            }
                                          ),
                                          width: "2X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              "CS 3701 Introduction to Cybersecurity"
                                            }
                                          ),
                                          width: "5X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(icon: "map-marker"),
                                              " Orborne Hall"
                                            }
                                          ),
                                          width: "2X"
                                        )
                                      },
                                      alignVertical: "TOP"
                                    )
                                  },
                                  divider: "ABOVE"
                                )
                              },
                              height: "AUTO",
                              style: "NONE",
                              padding: "STANDARD",
                              marginBelow: "STANDARD",
                              showBorder: false,
                              showShadow: true,
                              decorativeBarPosition: "START",
                              decorativeBarColor: "#fff"
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
                                                text: { "Tuesday" },
                                                size: "MEDIUM",
                                                style: { "STRONG" }
                                              )
                                            }
                                          )
                                        )
                                      },
                                      alignVertical: "MIDDLE"
                                    )
                                  },
                                  marginBelow: "NONE"
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
                                                text: { "10:15AM – 11:30AM" },
                                                style: { "STRONG" }
                                              )
                                            }
                                          ),
                                          width: "2X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: { "KOR 2020 Intermediate Korean II" }
                                          ),
                                          width: "5X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(icon: "map-marker"),
                                              " Phillips 329"
                                            }
                                          ),
                                          width: "2X"
                                        )
                                      },
                                      alignVertical: "TOP"
                                    )
                                  },
                                  divider: "ABOVE",
                                  marginBelow: "NONE"
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
                                                text: { "3:30PM – 4:45PM" },
                                                style: { "STRONG" }
                                              )
                                            }
                                          ),
                                          width: "2X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: { "CS 4710 Artificial Intelligence" }
                                          ),
                                          width: "5X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(icon: "map-marker"),
                                              " Orborne Hall"
                                            }
                                          ),
                                          width: "2X"
                                        )
                                      },
                                      alignVertical: "TOP"
                                    )
                                  },
                                  divider: "ABOVE"
                                )
                              },
                              height: "AUTO",
                              style: "NONE",
                              padding: "STANDARD",
                              marginBelow: "STANDARD",
                              showBorder: false,
                              showShadow: true,
                              decorativeBarPosition: "START",
                              decorativeBarColor: "ACCENT"
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
                                              a!richTextItem(text: { "Wednesday" }, size: "MEDIUM")
                                            }
                                          )
                                        )
                                      },
                                      alignVertical: "MIDDLE"
                                    )
                                  },
                                  marginBelow: "NONE"
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
                                                text: { "9:00AM – 10:00AM" },
                                                style: { "STRONG" }
                                              )
                                            }
                                          ),
                                          width: "2X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              "CS 3100 Data Structures & Algorithms II"
                                            }
                                          ),
                                          width: "5X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(icon: "map-marker"),
                                              " Thompson 404"
                                            }
                                          ),
                                          width: "2X"
                                        )
                                      },
                                      alignVertical: "TOP"
                                    )
                                  },
                                  divider: "ABOVE",
                                  marginBelow: "NONE"
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
                                                text: { "12:45PM – 2:15PM" },
                                                style: { "STRONG" }
                                              )
                                            }
                                          ),
                                          width: "2X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: { "CS 3205 HCI in Software Development" }
                                          ),
                                          width: "5X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(icon: "map-marker"),
                                              " Flores A201"
                                            }
                                          ),
                                          width: "2X"
                                        )
                                      },
                                      alignVertical: "TOP"
                                    )
                                  },
                                  divider: "ABOVE",
                                  marginBelow: "NONE"
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
                                                text: { "4:00PM – 5:30PM" },
                                                style: { "STRONG" }
                                              )
                                            }
                                          ),
                                          width: "2X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              "CS 3701 Introduction to Cybersecurity"
                                            }
                                          ),
                                          width: "5X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(icon: "map-marker"),
                                              " Orborne Hall"
                                            }
                                          ),
                                          width: "2X"
                                        )
                                      },
                                      alignVertical: "TOP"
                                    )
                                  },
                                  divider: "ABOVE"
                                )
                              },
                              height: "AUTO",
                              style: "NONE",
                              padding: "STANDARD",
                              marginBelow: "STANDARD",
                              showBorder: false,
                              showShadow: true,
                              decorativeBarPosition: "START",
                              decorativeBarColor: "#fff"
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
                                              a!richTextItem(text: { "Thursday" }, size: "MEDIUM")
                                            }
                                          )
                                        )
                                      },
                                      alignVertical: "MIDDLE"
                                    )
                                  },
                                  marginBelow: "NONE"
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
                                                text: { "10:15AM – 11:30AM" },
                                                style: { "STRONG" }
                                              )
                                            }
                                          ),
                                          width: "2X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: { "KOR 2020 Intermediate Korean II" }
                                          ),
                                          width: "5X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(icon: "map-marker"),
                                              " Phillips 329"
                                            }
                                          ),
                                          width: "2X"
                                        )
                                      },
                                      alignVertical: "TOP"
                                    )
                                  },
                                  divider: "ABOVE",
                                  marginBelow: "NONE"
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
                                                text: { "3:30PM – 4:45PM" },
                                                style: { "STRONG" }
                                              )
                                            }
                                          ),
                                          width: "2X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: { "CS 4710 Artificial Intelligence" }
                                          ),
                                          width: "5X"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(icon: "map-marker"),
                                              " Orborne Hall"
                                            }
                                          ),
                                          width: "2X"
                                        )
                                      },
                                      alignVertical: "TOP"
                                    )
                                  },
                                  divider: "ABOVE"
                                )
                              },
                              height: "AUTO",
                              style: "NONE",
                              padding: "STANDARD",
                              marginBelow: "STANDARD",
                              showBorder: false,
                              showShadow: true,
                              decorativeBarPosition: "START",
                              decorativeBarColor: "#fff"
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
                                              a!richTextItem(text: { "Friday" }, size: "MEDIUM")
                                            }
                                          )
                                        )
                                      },
                                      alignVertical: "MIDDLE"
                                    )
                                  },
                                  marginBelow: "NONE"
                                ),
                                a!sectionLayout(
                                  label: "",
                                  contents: {
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(
                                          text: { "No classes scheduled" },
                                          color: "SECONDARY"
                                        )
                                      },
                                      align: "CENTER",
                                      marginAbove: "LESS"
                                    )
                                  },
                                  divider: "ABOVE",
                                  marginAbove: "NONE",
                                  marginBelow: "STANDARD"
                                )
                              },
                              height: "AUTO",
                              style: "NONE",
                              padding: "STANDARD",
                              marginBelow: "STANDARD",
                              showBorder: false,
                              showShadow: true,
                              decorativeBarPosition: "START",
                              decorativeBarColor: "#fff"
                            )
                          }
                        )
                      }
                    ),
                    a!columnLayout(
                      contents: {
                        a!sectionLayout(
                          label: "My Path to Graduation",
                          labelSize: "MEDIUM",
                          labelColor: "STANDARD",
                          contents: {
                            a!cardLayout(
                              contents: {
                                a!sideBySideLayout(
                                  items: {
                                    a!sideBySideItem(
                                      item: a!gaugeField(
                                        labelPosition: "COLLAPSED",
                                        percentage: 77.0,
                                        primaryText: a!gaugeIcon(icon: "graduation-cap", color: "#555"),
                                        size: "SMALL"
                                      ),
                                      width: "MINIMIZE"
                                    ),
                                    a!sideBySideItem(
                                      item: a!richTextDisplayField(
                                        labelPosition: "COLLAPSED",
                                        value: {
                                          a!richTextItem(
                                            text: { "Bachelor of Science (BS)" },
                                            size: "MEDIUM_PLUS"
                                          ),
                                          char(10),
                                          a!richTextItem(text: { "Spring 2022" }, size: "MEDIUM")
                                        }
                                      )
                                    )
                                  },
                                  alignVertical: "MIDDLE",
                                  spacing: "SPARSE",
                                  marginAbove: "LESS",
                                  marginBelow: "STANDARD"
                                ),
                                a!columnsLayout(
                                  columns: {
                                    a!columnLayout(
                                      contents: {
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "REQUIRED CREDITS" },
                                              color: "SECONDARY",
                                              size: "SMALL"
                                            ),
                                            char(10),
                                            a!richTextItem(text: { "120" }, size: "LARGE")
                                          }
                                        )
                                      }
                                    ),
                                    a!columnLayout(
                                      contents: {
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "COMPLETED CREDITS" },
                                              color: "SECONDARY",
                                              size: "SMALL"
                                            ),
                                            char(10),
                                            a!richTextItem(text: { "92" }, size: "LARGE")
                                          }
                                        )
                                      }
                                    ),
                                    a!columnLayout(
                                      contents: {
                                        a!richTextDisplayField(
                                          labelPosition: "COLLAPSED",
                                          value: {
                                            a!richTextItem(
                                              text: { "IN-PROGRESS CREDITS" },
                                              color: "SECONDARY",
                                              size: "SMALL"
                                            ),
                                            char(10),
                                            a!richTextItem(text: { "15" }, size: "LARGE")
                                          }
                                        )
                                      }
                                    )
                                  },
                                  alignVertical: "MIDDLE",
                                  showDividers: true
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
                                              a!richTextIcon(
                                                icon: "check-circle",
                                                color: "POSITIVE",
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
                                              a!richTextItem(
                                                text: { "Exceed minimum GPA" },
                                                size: "MEDIUM"
                                              )
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(
                                                icon: "info-circle",
                                                color: "SECONDARY",
                                                size: "SMALL"
                                              )
                                            }
                                          ),
                                          width: "MINIMIZE"
                                        )
                                      },
                                      alignVertical: "MIDDLE"
                                    ),
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(
                                                icon: "check-circle",
                                                color: "POSITIVE",
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
                                              a!richTextItem(
                                                text: { "Maintain good standing" },
                                                size: "MEDIUM"
                                              )
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(
                                                icon: "info-circle",
                                                color: "SECONDARY",
                                                size: "SMALL"
                                              )
                                            }
                                          ),
                                          width: "MINIMIZE"
                                        )
                                      },
                                      alignVertical: "MIDDLE"
                                    ),
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(
                                                icon: "circle-o-notch",
                                                color: "SECONDARY",
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
                                              a!richTextItem(
                                                text: { "Complete required degree classes" },
                                                size: "MEDIUM"
                                              )
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(
                                                icon: "info-circle",
                                                color: "SECONDARY",
                                                size: "SMALL"
                                              )
                                            }
                                          ),
                                          width: "MINIMIZE"
                                        )
                                      },
                                      alignVertical: "MIDDLE"
                                    ),
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(
                                                icon: "check-circle",
                                                color: "POSITIVE",
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
                                              a!richTextItem(
                                                text: { "Complete required electives" },
                                                size: "MEDIUM"
                                              )
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextIcon(
                                                icon: "info-circle",
                                                color: "SECONDARY",
                                                size: "SMALL"
                                              )
                                            }
                                          ),
                                          width: "MINIMIZE"
                                        )
                                      },
                                      alignVertical: "MIDDLE"
                                    )
                                  },
                                  divider: "ABOVE",
                                  marginBelow: "EVEN_LESS"
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
                                        a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
                                      },
                                      size: "FIT",
                                      isThumbnail: false,
                                      style: "STANDARD"
                                    )
                                  },
                                  width: "NARROW"
                                ),
                                a!columnLayout(
                                  contents: {
                                    a!richTextDisplayField(
                                      labelPosition: "COLLAPSED",
                                      value: {
                                        a!richTextItem(
                                          text: {
                                            "Spring Semester Class Registration is Now Open"
                                          },
                                          color: "ACCENT",
                                          size: "MEDIUM",
                                          style: { "STRONG" }
                                        )
                                      }
                                    ),
                                    a!buttonArrayLayout(
                                      buttons: {
                                        a!buttonWidget(
                                          label: "Register Now",
                                          icon: "pen-fancy",
                                          size: "SMALL",
                                          style: "OUTLINE"
                                        )
                                      },
                                      align: "START"
                                    )
                                  }
                                )
                              },
                              alignVertical: "MIDDLE"
                            )
                          },
                          height: "AUTO",
                          style: "#f1e8f4",
                          marginBelow: "MORE",
                          showBorder: false,
                          showShadow: true,
                          decorativeBarPosition: "TOP",
                          decorativeBarColor: "ACCENT"
                        ),
                        a!sectionLayout(
                          label: "My Support Team",
                          labelSize: "MEDIUM",
                          labelColor: "STANDARD",
                          contents: {
                            a!cardLayout(
                              contents: {
                                a!sectionLayout(
                                  label: "",
                                  contents: {
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!imageField(
                                            label: "",
                                            labelPosition: "COLLAPSED",
                                            images: {
                                              a!webImage(
                                                source: "https://randomuser.me/api/portraits/women/27.jpg"
                                              )
                                            },
                                            size: "SMALL",
                                            isThumbnail: false,
                                            style: "AVATAR"
                                          ),
                                          width: "MINIMIZE"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(
                                                text: { "Marsha McCoy" },
                                                size: "MEDIUM",
                                                style: { "STRONG" }
                                              ),
                                              char(10),
                                              "Faculty Advisor"
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!buttonArrayLayout(
                                            buttons: {
                                              a!buttonWidget(
                                                label: "Schedule Meeting",
                                                icon: "calendar",
                                                size: "SMALL",
                                                style: "OUTLINE", 
                                                color: "SECONDARY"
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
                                  divider: "BELOW"
                                ),
                                a!sectionLayout(
                                  label: "",
                                  contents: {
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!imageField(
                                            label: "",
                                            labelPosition: "COLLAPSED",
                                            images: {
                                              a!webImage(
                                                source: "https://randomuser.me/api/portraits/men/39.jpg"
                                              )
                                            },
                                            size: "SMALL",
                                            isThumbnail: false,
                                            style: "AVATAR"
                                          ),
                                          width: "MINIMIZE"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(
                                                text: { "Praveen Sharma" },
                                                size: "MEDIUM",
                                                style: { "STRONG" }
                                              ),
                                              char(10),
                                              "Peer Advisor"
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!buttonArrayLayout(
                                            buttons: {
                                              a!buttonWidget(
                                                label: "Schedule Meeting",
                                                icon: "calendar",
                                                size: "SMALL",
                                                style: "OUTLINE", 
                                                color: "SECONDARY"
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
                                  divider: "BELOW"
                                ),
                                a!sectionLayout(
                                  label: "",
                                  contents: {
                                    a!sideBySideLayout(
                                      items: {
                                        a!sideBySideItem(
                                          item: a!imageField(
                                            label: "",
                                            labelPosition: "COLLAPSED",
                                            images: {
                                              a!webImage(
                                                source: "https://randomuser.me/api/portraits/women/59.jpg"
                                              )
                                            },
                                            size: "SMALL",
                                            isThumbnail: false,
                                            style: "AVATAR"
                                          ),
                                          width: "MINIMIZE"
                                        ),
                                        a!sideBySideItem(
                                          item: a!richTextDisplayField(
                                            labelPosition: "COLLAPSED",
                                            value: {
                                              a!richTextItem(
                                                text: { "Sara Vargas" },
                                                size: "MEDIUM",
                                                style: { "STRONG" }
                                              ),
                                              char(10),
                                              "Wellness Coach"
                                            }
                                          )
                                        ),
                                        a!sideBySideItem(
                                          item: a!buttonArrayLayout(
                                            buttons: {
                                              a!buttonWidget(
                                                label: "Schedule Meeting",
                                                icon: "calendar",
                                                size: "SMALL",
                                                style: "OUTLINE", 
                                                color: "SECONDARY"
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
                                  divider: "NONE",
                                  marginBelow: "EVEN_LESS"
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
                      width: "MEDIUM_PLUS"
                    )
                  },
                  spacing: "SPARSE",
                  stackWhen: {
                    "PHONE",
                    "TABLET_PORTRAIT",
                    "TABLET_LANDSCAPE",
                    "DESKTOP_NARROW"
                  }
                )
              },
              height: "AUTO",
              style: "#f3f0f6",
              padding: "MORE",
              marginBelow: "NONE",
              showBorder: false
            )
          }
        )
      }
    )
  },
  backgroundColor: "#f3f0f6",
  contentsPadding: "NONE"
)
```
