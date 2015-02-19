dayRow = @_testing_xdatetime.dayRow
show_calendar = @_testing_xdatetime.show_calendar
data = @_testing_xdatetime.data

describe 'test dayRow',->
  it 'test', ->
    list = (x.value for x in dayRow(0, moment.utc('18-01-2015','DD-MM-YYYY')))
    expect(list).toEqual(['29','30','31','01','02','03','04'])
  it 'test 2', ->
    list = (x.value for x in dayRow(4, moment.utc('18-01-2015','DD-MM-YYYY')))
    expect(list).toEqual(['26','27','28','29','30','31','01'])
  it 'test 3', ->
    list = (x.value for x in dayRow(5, moment.utc('18-01-2015','DD-MM-YYYY')))
    expect(list).toEqual([])

describe 'test init', ->
  it 'test', ->
    m=moment('2015-01-01')
    spyOn(window, 'moment').and.returnValue(m)
    el = Blaze.renderWithData(Template.testing, {}, $('body')[0])
    Meteor.flush()
    back=$('[formid=0].xwidget').val()
    bool = moment(back).isSame(m)
    expect(bool).toBe(true)
    Blaze.remove(el)

describe 'test no degeneration', ->
  it 'test', ->
    el = Blaze.renderWithData(Template.testing, {datetime1: moment('2015-01-01').toDate()}, $('body')[0])
    Meteor.flush()
    date = moment().startOf('minute').utc().toDate()
    $('[formid=0].xwidget').val(date)
    date2 = $('[formid=0].xwidget').val()
    $('[formid=0].xwidget').val(date2)
    date3 = $('[formid=0].xwidget').val()
    bool = moment(date).isSame(moment(date3))
    expect(bool).toBe(true)
    Blaze.remove(el)


describe 'test basics', ->
  el= null
  beforeEach ->
    el = Blaze.renderWithData(Template.testing, {datetime1: moment('2015-01-01').toDate()}, $('body')[0])
    Meteor.flush()
  afterEach ->
    Blaze.remove(el)

  it 'test set get', ->
    m = moment.utc().toDate()
    $('[formid=0].xwidget').val(m)
    Meteor.flush()
    back = moment($('[formid=0].xwidget').val())
    bool = moment(m).startOf('minute').isSame(back)
    expect(bool).toBe(true)

  it 'test init get', ->
    back = moment($('[formid=0].xwidget').val())
    bool = moment('2015-01-01').isSame(back)
    expect(bool).toBe(true)

  it 'test click day', ->
    $('[formid=0].xwidget').val(moment.utc().toDate())
    $('[formid=0] .show-calendar').trigger('click')
    Tracker.flush()
    $('[formid=0] .xtoday').trigger('click')
    Tracker.flush()
    back = moment($('[formid=0].xwidget').val()).startOf('day').utc()
    today = moment().startOf('day').utc()
    expect(back.isSame(today)).toBe(true)

describe 'test ui', ->
  el= null
  beforeEach ->
    show_calendar.set(false)
    el = Blaze.renderWithData(Template.testing, {datetime1: moment('2015-01-01').toDate()}, $('body')[0])
    Meteor.flush()
    $('[formid=0] .show-calendar').trigger('click')
    Meteor.flush()

  afterEach ->
    if show_calendar.get()
      $('[formid=0] .show-calendar').trigger('click')
      Meteor.flush()
    Blaze.remove(el)

  it 'test minus 1 minute', ->
    path_ = '0:datetime1'
    dt = data.findOne(path: path_).value
    $('[formid=0] .minus-minute').trigger('click')
    dt2 = data.findOne(path: path_).value
    expect(dt.diff(dt2, 'minutes')).toBe(1)

  it 'test plus 1 minute', ->
    path_ = '0:datetime1'
    dt = data.findOne(path: path_).value
    $('[formid=0] .plus-minute').trigger('click')
    dt2 = data.findOne(path: path_).value
    expect(dt.diff(dt2, 'minutes')).toBe(-1)

  it 'test minus 1 hour', ->
    path_ = '0:datetime1'
    dt = data.findOne(path: path_).value
    $('[formid=0] .minus-hour').trigger('click')
    dt2 = data.findOne(path: path_).value
    expect(dt.diff(dt2, 'hours')).toBe(1)

  it 'test plus 1 hour', ->
    path_ = '0:datetime1'
    dt = data.findOne(path: path_).value
    $('[formid=0] .plus-hour').trigger('click')
    dt2 = data.findOne(path: path_).value
    expect(dt.diff(dt2, 'hours')).toBe(-1)

  it 'test minus 1 month', ->
    path_ = '0:datetime1'
    dt = data.findOne(path: path_).value
    $('[formid=0] .minus-month').trigger('click')
    dt2 = data.findOne(path: path_).value
    expect(dt.diff(dt2, 'months')).toBe(1)

  it 'test plus 1 month', ->
    path_ = '0:datetime1'
    dt = data.findOne(path: path_).value
    $('[formid=0] .plus-month').trigger('click')
    dt2 = data.findOne(path: path_).value
    expect(dt.diff(dt2, 'months')).toBe(-1)

  it 'test minus 1 year', ->
    path_ = '0:datetime1'
    dt = data.findOne(path: path_).value
    $('[formid=0] .minus-year').trigger('click')
    dt2 = data.findOne(path: path_).value
    expect(dt.diff(dt2, 'years')).toBe(1)

  it 'test plus 1 year', ->
    path_ = '0:datetime1'
    dt = data.findOne(path: path_).value
    $('[formid=0] .plus-year').trigger('click')
    dt2 = data.findOne(path: path_).value
    expect(dt.diff(dt2, 'years')).toBe(-1)

  it 'test change input date', ->
    path_ = '0:datetime1'
    $('[formid=0] .xdatetime-input').val('01-01-2015 00:00')
    $('[formid=0] .xdatetime-input').trigger('focusin')
    $('[formid=0] .xdatetime-input').trigger('focusout')
    dt_format = data.findOne(path: path_).value.clone().local().format('DD-MM-YYYY HH:mm')
    expect(dt_format).toBe('01-01-2015 00:00')

