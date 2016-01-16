
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
