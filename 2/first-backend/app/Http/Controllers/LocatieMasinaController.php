<?php

namespace App\Http\Controllers;

use App\Models\LocatieMasina;
use App\Services\LocatieMasinaService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class LocatieMasinaController extends Controller
{
    private LocatieMasinaService $locatieMasinaService;
    public function __construct(LocatieMasinaService $locatieMasinaService)
    {
        $this->locatieMasinaService = $locatieMasinaService;
    }

    /**
     * @OA\Get(
     *    path="/locatie",
     *    summary="Returneaza toate locatiile masinii",
     *    tags={"Locatie"},
     *    description="Returneaza toate locatiile masinii",
     *   @OA\Response(
     *        response=200,
     *        description="Success"
     *    )
     * )
     */
    public function index(): JsonResponse
    {
        $data = LocatieMasina::all();
        return response()->json($data, Response::HTTP_OK);
    }

    /**
     * @OA\Post(
     *    path="/locatii",
     *    summary="Adauga locatia",
     *    tags={"Locatii"},
     *    description="Adauga locatia",
     *     @OA\RequestBody(
     *          required=true,
     *          @OA\JsonContent(
     *              @OA\Property(
     *                  property="adresa",
     *                  type="string",
     *                  description="",
     *                  example="Bucuresti, Bd. Iuliu Maniu, Nr. 54",
     *              ),
     *              @OA\Property(
     *                  property="codPostal",
     *                  type="string",
     *                  description="",
     *                  example="063423",
     *              ),
     *              @OA\Property(
     *                  property="email",
     *                  type="string",
     *                  description="",
     *                  example="bucuresti@first.ro",
     *              ),
     *              @OA\Property(
     *                  property="nrTelefon",
     *                  type="string",
     *                  description="",
     *                  example="+40244234340",
     *              )
     *          )
     *     ),
     *   @OA\Response(
     *        response=200,
     *        description="Success"
     *    )
     * )
     */
    public function store(Request $request): JsonResponse
    {
        $data = new LocatieMasina;
        $this->locatieMasinaService->setProperties($data, $request->all());
        $data->save();
        return response()->json($data, Response::HTTP_OK);
    }

    /**
     * @OA\Delete(
     *    path="/locatii/{id}",
     *    summary="Sterge locatia cu id-ul dat",
     *    tags={"Locatii"},
     *    description="Sterge locatia cu id-ul dat",
     *    @OA\Parameter(
     *        name="id",
     *        description="Id-ul locatiei dorite",
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
    public function destroy($id): JsonResponse
    {
        $data = LocatieMasina::where('idLocatieMasina', '=', $id)->firstOrFail();
        $data->delete();
        return response()->json("DELETED", Response::HTTP_OK);
    }
}
