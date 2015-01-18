@dateSchema = dateSchema = new SimpleSchema
  datetime1:
    type: String
    optional: true
  datetime2:
    type: String
    optional: true

Template.xdatetime_view.helpers
  data: -> {datetime1: moment.utc().toDate(), datetime2: moment.utc().toDate()}

AutoForm.hooks
  id1:
    before:
      save: (doc, template) ->
        console.log doc
        false