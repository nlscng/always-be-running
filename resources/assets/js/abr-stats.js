//for generating statistics and Know the Meta integration

// gets the available data pack names from KtM
function getKTMDataPacks(callback) {
    $.ajax({
        url: "http://www.knowthemeta.com/JSON/Cardpacks",
        dataType: "json",
        async: true,
        success: function (data) {
            var result = [];
            for (var i = 0, len = data.length; i < len; i++) {
                if (data[i].datapacks.length) {
                    result = result.concat(data[i].datapacks);
                } else {
                    result.push(data[i].title);
                }
            }
            callback(result);
        }
    });
}

// update the popular IDs box on the homepage
function updatePopularIds(packname) {
    // update pack name
    $('#hot-packname').html(packname.replace(new RegExp(' ', 'g'), '&nbsp;'));
    // get runner
    $.ajax({
        url: "http://www.knowthemeta.com/JSON/Tournament/runner/" + packname,
        dataType: "json",
        async: true,
        success: function (data) {
            data.ids.sort(tournamentShorters.byAllStanding);
            addCardStat('#hot-id-runner', data.ids[0], data.allStandingCount, data.topStandingCount);
            // get corp
            $.ajax({
                url: "http://www.knowthemeta.com/JSON/Tournament/corp/" + packname,
                dataType: "json",
                async: true,
                success: function (data) {
                    data.ids.sort(tournamentShorters.byAllStanding);
                    addCardStat('#hot-id-corp', data.ids[0], data.allStandingCount, data.topStandingCount);
                }
            });
        }
    });
}

// for sorting tournament drilldown data from KtM
var tournamentShorters = {
    byTopStanding : function (a,b) {
        return (b.topStandingCount - a.topStandingCount);
    },
    byAllStanding : function (a,b) {
        return (b.allStandingCount - a.allStandingCount);
    },
    byAllDeck : function (a,b) {
        return (b.allDeckCount - a.allDeckCount);
    },
    byInTopDeck: function (a,b) {
        return (b.intopdecks - a.intopdecks);
    },
    byTopAllFractionStanding: function(a,b) {
        return (b.topStandingCount / b.allStandingCount - a.topStandingCount / a.allStandingCount)
    }
};

var idShorter = function (a,b) {
    if (b[0] === 'unknown') {
        return -1;
    }
    if (a[0] === 'unknown') {
        return 1;
    }
    return (b[1] - a[1]);
};

// adds card with statistics
function addCardStat(element, card, allCount, topCount) {
    $(element).append($('<a>', {
        href: 'http://www.knowthemeta.com/Cards/' + card.title + '/'
    }).append($('<img>', {
        src: imageURL(card.title)
    }), $('<div>', {
        class: 'small-text',
        text: card.title
    })), $('<div>', {
        class: 'small-text',
        text: 'all: ' + percentageToString(card.allStandingCount / allCount) +
        ' - top: ' + percentageToString(card.topStandingCount / topCount)
    }));
    $(element).removeClass('loader');
}

// generates image URL for KtM
function imageURL(title) {
    return "http://www.knowthemeta.com/static/img/cards/netrunner-" +
        title.toLowerCase().replace(new RegExp(" ", 'g'), "-").replace(new RegExp("[^a-z0-9.-]", 'g'), "") + ".png";
}

// pie charts on IDs on tournament detail page
function drawEntryStats(data, side, element, playersNum) {
    var stat_results = [['ID', 'number of decks', 'faction']], unknown = -1;
    for (var i = 0, len = data.length; i < len; i++) {
        var found = false;
        for (var u = 1, len2 = stat_results.length; u < len2; u++) {
            if (shortenID(data[i][side+'_deck_identity_title']) === stat_results[u][0]) {
                stat_results[u][1]++;
                found = true;
                break;
            }
        }
        if (!found) {
            stat_results.push([shortenID(data[i][side+'_deck_identity_title']), 1, data[i][side+'_deck_identity_faction']]);
            if (shortenID(data[i][side+'_deck_identity_title']) === 'unknown') {
                unknown = stat_results.length-1;
            }
        }

    }

    // adding unknown IDs
    if (data.length < playersNum ) {
        if (unknown == -1) {
            stat_results.push(['unknown', playersNum - data.length, 'unknown']);
        } else {
            stat_results[unknown][1] = stat_results[unknown][1] + playersNum - data.length;
        }
    }

    stat_results.sort(idShorter);

    var slices = [];
    for (var u = 1, len2 = stat_results.length; u < len2; u++) {
        slices.push({color: factionCodeToColor(stat_results[u][2])});
    }

    var chartdata = google.visualization.arrayToDataTable(stat_results);

    var options = {
        chartArea: {left:0,top:0,width:'100%',height:'100%'},
        slices: slices
    };

    var chart = new google.visualization.PieChart(document.getElementById(element));

    chart.draw(chartdata, options);
}

// pie charts on IDs on tournament detail page
function drawResultStats(element, data, threshold) {
    var stat_results = [['ID', 'number of decks', 'faction']];
    for (var i = 0, len = data.length; i < len; i++) {
        stat_results.push([shortenID(data[i]['title']), data[i]['allStandingCount'], data[i]['faction']]);
    }

    var slices = [];
    for (var u = 1, len2 = stat_results.length; u < len2; u++) {
        slices.push({color: factionCodeToColor(stat_results[u][2])});
    }

    var chartdata = google.visualization.arrayToDataTable(stat_results);

    var options = {
        chartArea: {left:0,top:0,width:'100%',height:'100%'},
        slices: slices,
        sliceVisibilityThreshold: threshold
    };

    var chart = new google.visualization.PieChart(document.getElementById(element));

    chart.draw(chartdata, options);
}

// ID pie charts on Results page
function updateIdStats(packname) {
    // update pack name
    $('#stat-packname').html(packname.replace(new RegExp(' ', 'g'), '&nbsp;'));
    $('.stat-chart').addClass('hidden-xs-up');
    $('.stat-load').removeClass('hidden-xs-up');
    // get runner
    $.ajax({
        url: "http://www.knowthemeta.com/JSON/Tournament/runner/" + packname,
        dataType: "json",
        async: true,
        success: function (data) {
            $('.stat-error').addClass('hidden-xs-up');
            $('.stat-chart').removeClass('hidden-xs-up');
            data.ids.sort(tournamentShorters.byAllStanding);
            runnerIDs = data.ids;
            drawResultStats('stat-chart-runner', data.ids, 0.04);
            // get corp
            $.ajax({
                url: "http://www.knowthemeta.com/JSON/Tournament/corp/" + packname,
                dataType: "json",
                async: true,
                success: function (data) {
                    data.ids.sort(tournamentShorters.byAllStanding);
                    corpIDs = data.ids;
                    drawResultStats('stat-chart-corp', data.ids, 0.04);
                    $('.stat-chart').removeClass('hidden-xs-up');
                    $('.stat-load').addClass('hidden-xs-up');
                }
            });
        },
        // stat missing
        error: function () {
            $('.stat-error').removeClass('hidden-xs-up');
            $('.stat-load').addClass('hidden-xs-up');
        }
    });
}


// update filter settings for the Results page
function filterResults(filter, packlist) {
    var type = document.getElementById('tournament_type_id').value,
        cardpool = document.getElementById('cardpool').value,
        cardpoolName = $("#cardpool option:selected").text(),
        countrySelector = document.getElementById('location_country'),
        country = countrySelector.options[parseInt(countrySelector.value)+1].innerHTML;
    // type filtering
    if (type > 0) {
        filter = filter + '&type=' + type;
        $('#filter-type').addClass('active-filter');
    } else {
        $('#filter-type').removeClass('active-filter');
    }
    // country filtering
    if (country !== '---') {
        filter = filter + '&country=' + country;
        $('#filter-country').addClass('active-filter');
    } else {
        $('#filter-country').removeClass('active-filter');
    }
    // cardpool filtering
    if (cardpool != -1) {
        filter = filter + '&cardpool=' + cardpool;
        $('#filter-cardpool').addClass('active-filter');
    } else {
        $('#filter-cardpool').removeClass('active-filter');
    }

    $('.loader').removeClass('hidden-xs-up');
    $('#results').find('tbody').empty();
    getTournamentData(filter, function(data) {
        $('.loader').addClass('hidden-xs-up');
        updateTournamentTable('#results', ['title', 'date', 'location', 'cardpool', 'winner', 'players', 'claims'], 'no tournaments to show', '', data);
        if (currentPack !== cardpoolName) {
            currentPack = cardpoolName;
            // no filter is statistics for latest pack
            if (cardpoolName === '---') {
                cardpoolName = packlist[packlist.length-1];
            }
            updateIdStats(cardpoolName);
        }
    });
}
