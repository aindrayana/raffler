
# angular.module('Raffler' -> ng-app="Raffler"
# controller "RaffleCtrl" -> ng-controller="RaffleCtrl"
# angular.module('Raffler', []).controller "RaffleCtrl", ($scope) ->

# ngResource define resource as dependency of module Raffler
app = angular.module("Raffler", ["ngResource"])

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

# we then pass the resource as an argument into the RaffleCtrl controller
app.controller "RaffleCtrl", ($scope, $resource) ->
  # define $resource function that we call to communicate with json api and store it as Entry variable
  # $resource first argument specify the url to the api, the second specify the default parameter
  # third argument define additional action, we define update action and set method to PUT
  Entry = $resource("/entries/:id", {id: "@id"}, {update: {method: "PUT"}})
  $scope.entries = Entry.query()

  # addEntry function triggered when form is submited
  $scope.addEntry = ->
    # save new entry with Entry.save function
    entry = Entry.save($scope.newEntry)
    $scope.entries.push(entry)
    $scope.newEntry = {}

  # drawWinner function, select random entry and mark it as a winner
  $scope.drawWinner = ->
    # create pool array that will store previous winning entry
    pool = []
    angular.forEach $scope.entries, (entry) ->
      pool.push(entry) if !entry.winner
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.winner = true
      # when we mark entry as a winner we can update it by calling resource object $update()
      entry.$update()
      $scope.lastWinner = entry
