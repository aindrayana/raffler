
# angular.module('Raffler' -> ng-app="Raffler"
# controller "RaffleCtrl" -> ng-controller="RaffleCtrl"

# Raffler = angular.module('Raffler', [])
# Raffler.controller "RaffleCtrl", ($scope) ->
angular.module('Raffler', []).controller "RaffleCtrl", ($scope) ->
  $scope.entries = [
    {name: "Larry"}
    {name: "Curly"}
    {name: "Moe"}
  ]

  # addEntry function triggered when form is submited
  $scope.addEntry = ->
    $scope.entries.push($scope.newEntry)
    $scope.newEntry = {}

  # drawWinner function, select random entry and mark it as a winner
  $scope.drawWinner = ->
    entry = $scope.entries[Math.floor(Math.random()*$scope.entries.length)]
    entry.winner = true
    $scope.lastWinner = entry

# add drawWinner, select random entry and mark it as a winner
