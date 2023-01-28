<?php

namespace App\Http\Controllers;

use App\Models\Inchiriere;
use App\Services\InchiriereService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class InchiriereController extends Controller
{
    private InchiriereService $inchiriereService;
    public function __construct(InchiriereService $inchiriereService)
    {
        $this->inchiriereService = $inchiriereService;
    }

    /**
     * @OA\Get(
     *    path="/inchirieri",
     *    summary="Returneaza toate inchirierile",
     *    tags={"Inchirieri"},
     *    description="Returneaza toate inchirierile",
     *   @OA\Response(
     *        response=200,
     *        description="Success"
     *    )
     * )
     */
    public function index(): JsonResponse
    {
        $data = Inchiriere::all();
        return response()->json($data, Response::HTTP_OK);
    }

    /**
     * @OA\Get(
     *    path="/inchirieri/{id}",
     *    summary="Returneaza inchirierea cu id-ul dat",
     *    tags={"Inchirieri"},
     *    description="Returneaza inchirierea cu id-ul dat",
     *    @OA\Parameter(
     *        name="id",
     *        description="Id-ul inchirierii dorit",
     *        required=true,
     *        in="path",
     *        example=30,
     *        @OA\Schema(
     *            type="integer"
     *        )
     *    ),
     *   @OA\Response(
     *        response=200,
     *        description="Success"
     *    )
     * )
     */
    public function show($id): JsonResponse
    {
        $data = Inchiriere::where('idInchiriere', '=', $id)->firstOrFail();
        return response()->json($data, Response::HTTP_OK);
    }

    public function showClient($idClient): JsonResponse
    {
        $data = Inchiriere::where('idClient', '=', $idClient)->get();
        return response()->json($data, Response::HTTP_OK);
    }

    /**
     * @OA\Put(
     *    path="/inchirieri",
     *    summary="Update inchirierea cu id-ul dat",
     *    tags={"Inchirieri"},
     *    description="Update inchirierea cu id-ul dat",
     *     @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(
     *              @OA\Property(
     *                  property="idInchiriere",
     *                  type="integer",
     *                  description="",
     *                  example=1,
     *              ),
     *              @OA\Property(
     *                  property="idClient",
     *                  type="integer",
     *                  description="",
     *                  example=1,
     *              ),
     *              @OA\Property(
     *                  property="idMasina",
     *                  type="integer",
     *                  description="",
     *                  example=1,
     *              ),
     *              @OA\Property(
     *                  property="dataInchiriere",
     *                  type="date",
     *                  description="",
     *                  example="2022-10-17",
     *              ),
     *              @OA\Property(
     *                  property="dataPredareLimita",
     *                  type="date",
     *                  description="",
     *                  example="2022-10-23",
     *              ),
     *              @OA\Property(
     *                  property="dataPredareEfectiva",
     *                  type="date",
     *                  description="",
     *                  example="2022-10-23",
     *              ),
     *              @OA\Property(
     *                  property="idLocatieInchiriere",
     *                  type="integer",
     *                  description="",
     *                  example=5,
     *              ),
     *              @OA\Property(
     *                  property="idLocatiePredare",
     *                  type="integer",
     *                  description="",
     *                  example=3,
     *              )
     *          )
     *     ),
     *   @OA\Response(
     *        response=200,
     *        description="Success"
     *    )
     * )
     */
    public function update(Request $request): JsonResponse
    {
        $id = $request['idInchiriere'];
        Inchiriere::where('idInchiriere', '=', $id)->update([
            'idClient' => $request['idClient'],
            'idMasina' => $request['idMasina'],
            'dataInchiriere' => $request['dataInchiriere'],
            'dataPredareLimita' => $request['dataPredareLimita'],
            'dataPredareEfectiva' => $request['dataPredareEfectiva'],
            'idLocatieInchiriere' => $request['idLocatieInchiriere'],
            'idLocatiePredare' => $request['idLocatiePredare']
        ]);
        return response()->json("UPDATED", Response::HTTP_OK);
    }

    /**
     * @OA\Post(
     *    path="/inchirieri",
     *    summary="Adauga inchirierea",
     *    tags={"Inchirieri"},
     *    description="Adauga inchirierea",
     *     @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(
     *              @OA\Property(
     *                  property="idClient",
     *                  type="integer",
     *                  description="",
     *                  example=1,
     *              ),
     *              @OA\Property(
     *                  property="idMasina",
     *                  type="integer",
     *                  description="",
     *                  example=1,
     *              ),
     *              @OA\Property(
     *                  property="dataInchiriere",
     *                  type="date",
     *                  description="",
     *                  example="2022-10-17",
     *              ),
     *              @OA\Property(
     *                  property="dataPredareLimita",
     *                  type="date",
     *                  description="",
     *                  example="2022-10-23",
     *              ),
     *              @OA\Property(
     *                  property="dataPredareEfectiva",
     *                  type="date",
     *                  description="",
     *                  example="2022-10-23",
     *              ),
     *              @OA\Property(
     *                  property="idLocatieInchiriere",
     *                  type="integer",
     *                  description="",
     *                  example=5,
     *              ),
     *              @OA\Property(
     *                  property="idLocatiePredare",
     *                  type="integer",
     *                  description="",
     *                  example=3,
     *              )
     *          )
     *     ),
     *   @OA\Response(
     *        response=200,
     *        description="Success"
     *    ),
     *     @OA\Response(
     *        response=409,
     *        description="Conflict! Datele se suprapun"
     *    ),
     * @OA\Response(
     *        response=403,
     *        description="Clinetul selectat deja a inchiriat masina cu id-ul dat"
     *    )
     * )
     */
    public function store(Request $request)//: JsonResponse
    {
        $inchiriereMasini = Inchiriere::where('idMasina', '=', $request['idMasina'])->get();

        foreach ($inchiriereMasini as $inchiriereMasina) {
            if ($inchiriereMasina['idClient'] == $request['idClient']) {
                return response()->json("Clinetul selectat deja a inchiriat masina cu id-ul dat",Response::HTTP_FORBIDDEN);
            }
            $reqDataInchiriere = date('Y-m-d', strtotime($request['dataInchiriere']));
            $reqDataPredare = date('Y-m-d', strtotime($request['dataPredareLimita']));
            $masinaInchiriere = date('Y-m-d', strtotime($inchiriereMasina['dataInchiriere']));
            $masinaPredateEfectiva = date('Y-m-d', strtotime($inchiriereMasina['dataPredareEfectiva']));
            $masinaPredareLimita = date('Y-m-d', strtotime($inchiriereMasina['dataPredareLimita']));
            if ($reqDataInchiriere >= $masinaInchiriere && $reqDataInchiriere <= $masinaPredareLimita && $reqDataInchiriere <= $masinaPredateEfectiva) {
                return response()->json("Datele se suprapun - data inchiriere",Response::HTTP_CONFLICT);
            } else {
                if ($reqDataPredare >= $masinaInchiriere && $reqDataPredare <= $masinaPredareLimita && $reqDataPredare <= $masinaPredateEfectiva) {
                    return response()->json("Datele se suprapun - data predare",Response::HTTP_CONFLICT);
                }
            }
        }

        $data = new Inchiriere;
        $this->inchiriereService->setProperties($data, $request->all());
        $data->save();
        return response()->json($data, Response::HTTP_OK);
    }



    /**
     * @OA\Delete(
     *    path="/inchirieri",
     *    summary="Sterge inchirierea cu id-ul dat",
     *    tags={"Inchirieri"},
     *    description="Sterge inchirierea cu id-ul dat",
     *      @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(
     *              @OA\Property(
     *                  property="id",
     *                  type="integer",
     *                  description="",
     *                  example=1,
     *              ),
     *     )
     *    ),
     *   @OA\Response(
     *        response=200,
     *        description="Success"
     *    )
     * )
     */
    public function destroy(Request $request): JsonResponse
    {
        $data = Inchiriere::where('idInchiriere', '=', $request['id'])->delete();
        //$data->delete();
        return response()->json("DELETED", Response::HTTP_OK);
    }
}
