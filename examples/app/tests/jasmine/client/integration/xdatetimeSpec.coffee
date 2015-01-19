dayRow = @_testing_xdatetime.dayRow
xday = @_testing_xdatetime.xday
data = @data

describe 'test dayRow',->
  beforeEach ->
    xday.set(moment('18-01-2015','DD-MM-YYYY'))
  it 'test', ->
    list = (x.value for x in dayRow(0))
    expect(list).toEqual(['29','30','31','01','02','03','04'])
  it 'test 2', ->
    list = (x.value for x in dayRow(4))
    expect(list).toEqual(['26','27','28','29','30','31','01'])
  it 'test 3', ->
    list = (x.value for x in dayRow(5))
    expect(list).toEqual([])

describe 'test init', ->
  it 'test', ->
    m=moment('2015-01-01')
    spyOn(moment, 'utc').and.returnValue(m)
    el = Blaze.renderWithData(Template.testing, {}, $('body')[0])
    Meteor.flush()
    back=$('[formid=0].xwidget').val()
    bool = moment(back).isSame(m)
    expect(bool).toBe(true)
    Blaze.remove(el)

describe 'test...', ->
  el= null
  beforeEach ->
    el = Blaze.renderWithData(Template.testing, {}, $('body')[0])
    Meteor.flush()
  afterEach ->
    Blaze.remove(el)

  it 'test set get', ->
    m = moment.utc().seconds(0).milliseconds(0).toDate()
    $('[formid=0].xwidget').val(m)
    Meteor.flush()
    back = moment($('[formid=0].xwidget').val())
    bool = moment(m).isSame(back)
    expect(bool).toBe(true)

