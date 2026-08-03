/*This example is best viewed on mobile devices */
/*Click Tablet or Phone in the upper right to see how the interface displays on narrower screens */
a!localVariables(
  local!stepNumber: 1,
  choose(
    local!stepNumber,
    a!headerContentLayout(
      header: {
        a!cardLayout(
          contents: {
            a!imageField(
              label: "",
              labelPosition: "COLLAPSED",
              /* This is a placeholder image; replace as needed */
              images: {
                a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
              },
              size: "SMALL",
              isThumbnail: false,
              style: "STANDARD",
              align: "START"
            )
          },
          height: "AUTO",
          style: "#e4f1df",
          padding: "MORE",
          marginBelow: "NONE",
          showBorder: false
        )
      },
      contents: {
        a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: {
            a!richTextIcon(
              icon: "qrcode",
              color: "#b6d7a8",
              size: "EXTRA_LARGE"
            ),
            char(10),
            a!richTextItem(
              text: { "ABCDEFG" },
              color: "#b6d7a8",
              size: "STANDARD"
            )
          },
          align: "CENTER",
          marginAbove: "MORE",
          marginBelow: "MORE"
        ),
        a!richTextDisplayField(
          labelPosition: "COLLAPSED",
          value: {
            a!richTextItem(
              text: {
                "Please enter the 7-letter code found on the equipment identification plaque"
              },
              size: "MEDIUM"
            )
          },
          align: "CENTER",
          marginBelow: "MORE"
        ),
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {}),
            a!columnLayout(
              contents: {
                a!textField(
                  label: "",
                  labelPosition: "COLLAPSED",
                  saveInto: {},
                  refreshAfter: "UNFOCUS",
                  validations: {}
                )
              },
              width: "NARROW_PLUS"
            ),
            a!columnLayout(contents: {})
          },
          marginBelow: "MORE",
          stackWhen: { "NEVER" }
        ),
        a!columnsLayout(
          columns: {
            a!columnLayout(contents: {}),
            a!columnLayout(
              contents: {
                a!buttonArrayLayout(
                  buttons: {
                    a!buttonWidget(
                      label: "Go",
                      icon: "arrow-right",
                      size: "LARGE",
                      width: "FILL",
                      style: "SOLID",
                      value: 2,
                      saveInto: local!stepNumber
                    )
                  },
                  align: "START",
                  marginAbove: "STANDARD"
                )
              },
              width: "NARROW_PLUS"
            ),
            a!columnLayout(contents: {})
          },
          marginBelow: "MORE",
          stackWhen: { "NEVER" }
        )
      },
      backgroundColor: "#e4f1df"
    ),
    a!headerContentLayout(
      header: {
        a!cardLayout(
          contents: {
            a!imageField(
              label: "",
              labelPosition: "COLLAPSED",
              /* This is a placeholder image; replace as needed */
              images: {
                a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
              },
              size: "SMALL",
              isThumbnail: false,
              style: "STANDARD",
              align: "START"
            ),
            a!imageField(
              label: "",
              labelPosition: "COLLAPSED",
              /* This is a placeholder image; replace as needed */
              images: {
                a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
              },
              size: "MEDIUM",
              isThumbnail: false,
              style: "STANDARD",
              align: "CENTER"
            )
          },
          height: "AUTO",
          style: "#e4f1df",
          padding: "MORE",
          marginBelow: "NONE",
          showBorder: false
        )
      },
      contents: {
        a!sideBySideLayout(
          items: {
            a!sideBySideItem(
              item: a!stampField(
                labelPosition: "COLLAPSED",
                icon: "tag",
                backgroundColor: "#127d21",
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
                    text: { "Model 7100-Max Escalator" },
                    size: "MEDIUM"
                  )
                }
              )
            )
          },
          alignVertical: "MIDDLE",
          marginAbove: "STANDARD",
          marginBelow: "LESS"
        ),
        a!sideBySideLayout(
          items: {
            a!sideBySideItem(
              item: a!stampField(
                labelPosition: "COLLAPSED",
                icon: "map-marker",
                backgroundColor: "#127d21",
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
                    text: { "3/F – 4/F Southwest" },
                    size: "MEDIUM",
                    style: { "STRONG" }
                  ),
                  char(10),
                  a!richTextItem(
                    text: { "Appian Way Shopping Centre" },
                    size: "MEDIUM"
                  ),
                  char(10),
                  a!richTextItem(text: { "Leeds LS2 7AU" }, size: "MEDIUM"),
                  char(10),
                  a!richTextItem(text: { "United Kingdom" }, size: "MEDIUM")
                },
                marginAbove: "LESS",
                marginBelow: "NONE"
              )
            )
          },
          alignVertical: "TOP",
          marginAbove: "STANDARD",
          marginBelow: "LESS"
        ),
        a!sideBySideLayout(
          items: {
            a!sideBySideItem(
              item: a!stampField(
                labelPosition: "COLLAPSED",
                icon: "calendar",
                backgroundColor: "#127d21",
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
                    text: { "In service since 24 Mar 2019" },
                    size: "MEDIUM"
                  )
                }
              )
            )
          },
          alignVertical: "MIDDLE",
          marginAbove: "EVEN_LESS",
          marginBelow: "STANDARD"
        ),
        a!sectionLayout(
          label: "",
          contents: {
            a!buttonArrayLayout(
              buttons: {
                a!buttonWidget(
                  label: "View Service History",
                  size: "LARGE",
                  width: "FILL",
                  style: "OUTLINE"
                ),
                a!buttonWidget(
                  label: "Request Service",
                  size: "LARGE",
                  width: "FILL",
                  style: "SOLID",
                  value: 3,
                  saveInto: local!stepNumber
                )
              },
              align: "START",
              marginAbove: "NONE",
              marginBelow: "NONE"
            )
          },
          divider: "ABOVE",
          marginAbove: "MORE"
        )
      }
    ),
    a!headerContentLayout(
      header: {
        a!cardLayout(
          contents: {
            a!imageField(
              label: "",
              labelPosition: "COLLAPSED",
              /* This is a placeholder image; replace as needed */
              images: {
                a!documentImage(document: a!EXAMPLE_DOCUMENT_IMAGE())
              },
              size: "SMALL",
              isThumbnail: false,
              style: "STANDARD",
              align: "START"
            ),
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: { "Request Service" },
                  size: "LARGE",
                  style: { "STRONG" }
                )
              }
            ),
            a!richTextDisplayField(
              labelPosition: "COLLAPSED",
              value: {
                a!richTextItem(
                  text: { "Model 7100-Max Escalator" },
                  size: "STANDARD"
                )
              }
            )
          },
          height: "AUTO",
          style: "#e4f1df",
          padding: "MORE",
          marginBelow: "NONE",
          showBorder: false
        )
      },
      contents: {
        a!cardChoiceField(
          label: "Service Type",
          data: {
            a!map(
              id: 1,
              icon: "stethoscope",
              primaryText: "Inspection",
              secondaryText: "Perform routine maintenance"
            ),
            a!map(
              id: 2,
              icon: "wrench",
              primaryText: "Repair",
              secondaryText: "Fix a problem"
            )
          },
          cardTemplate: a!cardTemplateBarTextJustified(
            id: fv!data.id,
            primaryText: fv!data.primaryText,
            secondaryText: fv!data.secondaryText,
            icon: fv!data.icon
          ),
          value: 2,
          saveInto: {},
          maxSelections: 1,
          required: true,
          validations: {}
        ),
        a!paragraphField(
          label: "Problem Description",
          labelPosition: "ABOVE",
          instructions: "Please include any diagnostic trouble codes",
          saveInto: {},
          refreshAfter: "UNFOCUS",
          height: "MEDIUM",
          required: true,
          validations: {}
        ),
        a!fileUploadField(
          label: "Photos",
          labelPosition: "ABOVE",
          saveInto: {},
          validations: {}
        ),
        a!sectionLayout(
          label: "",
          contents: {
            a!sideBySideLayout(
              items: {
                a!sideBySideItem(
                  item: a!buttonArrayLayout(
                    buttons: {
                      a!buttonWidget(
                        label: "Cancel",
                        size: "LARGE",
                        width: "MINIMIZE",
                        style: "OUTLINE"
                      )
                    },
                    align: "START",
                    marginAbove: "NONE",
                    marginBelow: "NONE"
                  )
                ),
                a!sideBySideItem(
                  item: a!buttonArrayLayout(
                    buttons: {
                      a!buttonWidget(
                        label: "Submit Request",
                        size: "LARGE",
                        width: "MINIMIZE",
                        style: "SOLID"
                      )
                    },
                    align: "END",
                    marginAbove: "NONE",
                    marginBelow: "NONE"
                  )
                )
              }
            )
          },
          divider: "ABOVE",
          marginAbove: "MORE"
        )
      }
    )
  )
)
