const fs = require('fs')

const { installDirectory, bulletJournal } = require('../config.json')

const t = text => `${bulletJournal.task} ${text}`
const n = text => `${bulletJournal.note} ${text}`
const noop = () => null

const getDate = (d=new Date(), y=`${d.getUTCFullYear()}`, m=`${d.getUTCMonth() + 1}`, D=`${d.getUTCDate()}`) =>
  `${y}-${m.length === 1 ? `0${m}` : m}-${D.length === 1 ? `0${D}` : D}`

const add = val => 
  fs.appendFile(`${installDirectory}/tasks/${getDate()}.txt`, `${val}\n`, noop)

const addTask = ({ task }) => add(t(task))
const addNote = ({ note }) => add(n(note))

module.exports = { addTask, addNote }

