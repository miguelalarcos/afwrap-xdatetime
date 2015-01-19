@dateSchema = dateSchema = new SimpleSchema
  datetime1:
    type: Date #String
    optional: true
  datetime2:
    type: Date #String
    optional: true

Template.xdatetime_view.helpers
  data: -> {datetime1: moment.utc().toDate(), datetime2: moment.utc().toDate()}

AutoForm.hooks
  id1:
    before:
      save: (doc, template) ->
        console.log doc
        # comprobar que el objeto hace match con el esquema
        false