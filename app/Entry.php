<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Entry extends Model
{
    public $timestamps = true;
    protected $fillable = ['rank', 'rank_top', 'runner_deck_title', 'runner_deck_id', 'runner_deck_identity',
        'corp_deck_title', 'corp_deck_id', 'corp_deck_identity', 'approved', 'user', 'tournament_id', 'import_username',
        'runner_deck_type', 'corp_deck_type', 'netrunnerdb_claim_corp', 'netrunnerdb_claim_runner', 'type',
        'broken_runner', 'broken_corp'];
    protected $dates = ['created_at', 'updated_at'];
    protected $hidden = ['created_at', 'updated_at', 'netrunnerdb_claim_runner', 'netrunnerdb_claim_corp', 'type', 'approved', 'tournament_id'];
    protected $appends = ['corpDeckUrl', 'runnerDeckUrl'];

    public function tournament() {
        return $this->belongsTo(Tournament::class, 'tournament_id', 'id');
    }

    public function player() {
        return $this->hasOne(User::class, 'id', 'user');
    }

    public function corpIdentity() {
        return $this->hasOne(CardIdentity::class, 'id', 'corp_deck_identity');
    }

    public function runnerIdentity() {
        return $this->hasOne(CardIdentity::class, 'id', 'runner_deck_identity');
    }


    public function rank() {
        if ($this->rank_top) {
            return $this->rank_top;
        }
        return $this->rank;
    }

    public function corp_deck_url() {
        if ($this->corp_deck_type == 1) {
            return "https://netrunnerdb.com/en/decklist/".$this->corp_deck_id;  // public
        } elseif ($this->corp_deck_type == 2) {
            return "https://netrunnerdb.com/en/deck/view/".$this->corp_deck_id;  // private
        } else {
            return "";
        }
    }

    public function runner_deck_url() {
        if ($this->runner_deck_type == 1) {
            return "https://netrunnerdb.com/en/decklist/".$this->runner_deck_id;  // public
        } elseif ($this->runner_deck_type == 2) {
            return "https://netrunnerdb.com/en/deck/view/".$this->runner_deck_id;  // private
        } else {
            return "";
        }
    }

    public function getCorpDeckUrlAttribute() {
        return $this->corp_deck_url();
    }

    public function getRunnerDeckUrlAttribute() {
        return $this->runner_deck_url();
    }
}
