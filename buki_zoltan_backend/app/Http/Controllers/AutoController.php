<?php

namespace App\Http\Controllers;

use App\Models\Auto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AutoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return Auto::with('tulajdonos')->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        // Validálás
        $validator = Validator::make($request->all(),
        [
            'tulajdonos' => 'required',
            'model' => 'required',
            'marka' => 'required',
            'ar' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => 'Hiányos adatok'], 400);
        }

        $auto =  Auto::create($request->all());
        return response()->json(['id' => $auto->id], 201);
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Autó törlése
        $auto = Auto::where('id', '=', $id);

        if ($auto->exists()) {
            $auto->delete();
            return response('', 204);
        }
        return response('A keresett autó nem létezik.', 404);
    }
}
