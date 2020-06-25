const db = require("./../data/dbConfig");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
  addStep
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first()
    .then((record) => {
      return record !== undefined ? record : null;
    });
}

function findSteps(id) {
  return db("steps AS s")
    .select(["s.id", "s.step_number", "s.instructions", "schemes.scheme_name"])
    .where("s.scheme_id", id)
    .leftJoin("schemes", "s.scheme_id", "schemes.id");
}

function add(scheme) {
  return db("schemes")
    .insert(scheme)
    .then((ids) => {
      return findById(ids[0]);
    });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes);
}

function remove(id) {
  return db("schemes")
    .where({ id })
    .delete()
    .then((record) => (record === 1 ? record : null));
}

function addStep(step, scheme_id) {
  return db("steps")
    .insert({...step, scheme_id})
    .then(async ids => {
      const steps = await findSteps(scheme_id);
      return steps.find(step => step.id === ids[0])
    })
}