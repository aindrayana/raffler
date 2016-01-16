
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
    pool = []
    angular.forEach $scope.entries, (entry) ->
      pool.push(entry) if !entry.winner
    if pool.length > 0
      entry = $scope.entries[Math.floor(Math.random()*$scope.entries.length)]
      entry.winner = true
      $scope.lastWinner = entry
