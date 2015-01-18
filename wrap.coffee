AutoForm.addInputType "xdatetime",
  template: "xdatetime"
  valueOut: -> @val().toDate()
  valueIn: (date) -> moment(date)